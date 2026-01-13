--[[

    SCTE-104 TCP Wireshark Dissector

    This dissector implements SCTE-104 2023 edition protocol over TCP.
    https://account.scte.org/documents/6939/ANSI-SCTE_104_2023.pdf

    Only Simple Profile operations are fully parsed, the rest will
    be indicated but not dissected in detail.

]]                                                         --

set_plugin_info({                                          --    /\_/\
    version = "1.0.0",                                     --   ( o.o )
    description = "SCTE-104 Protocol Dissector",           --    > ^ <
    author = "Dimitri Tarassenko",                         --   /|   |\
    repository = "https://github.com/m1tk4/wireshark-scte" --  (_|   |_)~~
})                                                         --   ^^   ^^

-- NOTE: all references to chapters in SCTE-104 standard are as per 2023 edition.

local scte104_proto = Proto("scte104", "SCTE-104 Protocol")

-- opID Assigned Values for single_operation_message (Table 8-1)
local OPID_SINGLE_OP = {
    [0x0000] = "general_response_data()",
    [0x0001] = "init_request_data()",
    [0x0002] = "init_response_data()",
    [0x0003] = "alive_request_data()",
    [0x0004] = "alive_response_data()",
    [0x0007] = "inject_response_data()",
    [0x0008] = "inject_complete_response_data()",
    [0x0009] = "config_request_data()",
    [0x000A] = "config_response_data()",
    [0x000B] = "provisioning_request_data()",
    [0x000C] = "provisioning_response_data()",
    [0x000F] = "fault_request_data()",      --   ЦЫП!
    [0x0010] = "fault_response_data()",     --    __
    [0x0011] = "AS_alive_request_data()",   --  <(o )___
    [0x0012] = "AS_alive_response_data()",  --   ( ._> /
    [0xFFFF] = "Multiple Operation Message" --    `---'
}

-- opID Assigned Values for multiple_operation_message (Table 8-4)
local OPID_MULTI_OP = {
    [0x0100] = "inject_section_data_request()",
    [0x0101] = "splice_request_data()",
    [0x0102] = "splice_null_request_data()",
    [0x0103] = "start_schedule_download_request_data()",
    [0x0104] = "time_signal_request_data()",
    [0x0105] = "transmit_schedule_request_data()",
    [0x0106] = "component_mode_DPI_request_data()",
    [0x0107] = "encrypted_DPI_request_data()",
    [0x0108] = "insert_descriptor_request_data()",
    [0x0109] = "insert_DTMF_descriptor_request_data()",
    [0x010A] = "insert_avail_descriptor_request_data()",
    [0x010B] = "insert_segmentation_descriptor_request_data()",
    [0x010C] = "proprietary_command_request_data()",
    [0x010D] = "schedule_component_mode_request_data()",
    [0x010E] = "schedule_definition_data()",
    [0x010F] = "insert_tier_data()",
    [0x0110] = "insert_time_descriptor()",
    [0x0111] = "insert_audio_descriptor()",
    [0x0112] = "insert_audio_provisioning()",
    [0x0113] = "insert_alternate_break_duration()",
    [0x0300] = "delete_ControlWord_data()",
    [0x0301] = "update_ControlWord_data()"
}

-- Result Codes (Table 14-1)
local RESULT_CODES = {
    [100] = "Successful Response",
    [101] = "Access Denied-Injector not authorized for DPI service",
    [102] = "CW index does not have Code Word",
    [103] = "DPI has been de-provisioned",
    [104] = "DPI not supported",
    [105] = "Duplicate service name",
    [106] = "Duplicate service name is OK",
    [107] = "Encryption not supported",
    [108] = "Illegal shared value of DPI PID index found",
    [109] = "Inconsistent value of DPI PID index found",
    [110] = "Injector is already in use",
    [111] = "Injector is not provisioned to service this AS",
    [112] = "Injector Not Provisioned For DPI",
    [113] = "Injector will be replaced",
    [114] = "Invalid Message Size",
    [115] = "Invalid Message Syntax",
    [116] = "Invalid Version",
    [117] = "No fault found",
    [118] = "Service name is missing",
    [119] = "Shared value of DPI PID index not found",
    [120] = "Splice Request Failed - Unknown Failure",
    [121] = "Splice Request Is Rejected Bad splice_request parameter",
    [122] = "Splice Request Was Too Late - pre-roll is too small",
    [123] = "Time type unsupported",
    [124] = "Unknown Failure",
    [125] = "Unknown opID",
    [126] = "Unknown value for DPI_PID_index",
    [127] = "Version Mismatch",
    [128] = "Proxy Response"
}

local TIME_TYPES = {
    [0] = "None",
    [1] = "UTC",
    [2] = "VITC",
    [3] = "GPI"
}

local TIME_TYPE_LENGTHS = {
    [0] = 1,
    [1] = 7,
    [2] = 5,
    [3] = 3
}

local SPLICE_INSERT_TYPES = {
    [0] = "reserved",
    [1] = "spliceStart_normal",
    [2] = "spliceStart_immediate",
    [3] = "spliceEnd_normal",
    [4] = "spliceEnd_immediate",
    [5] = "splice_cancel",
}

-- Fields
local f = {
    opID                       = ProtoField.uint16("scte104.opID", "opID", base.HEX_DEC, OPID_SINGLE_OP),
    messageSize                = ProtoField.uint16("scte104.messageSize", "messageSize", base.DEC),
    result                     = ProtoField.uint8("scte104.result", "result", base.DEC_HEX, RESULT_CODES),
    result_extension           = ProtoField.uint8("scte104.result_extension", "result_extension", base.DEC_HEX),
    protocol_version           = ProtoField.uint8("scte104.protocol_version", "protocol_version", base.DEC),
    AS_index                   = ProtoField.uint8("scte104.AS_index", "AS_index", base.DEC_HEX),
    message_number             = ProtoField.uint8("scte104.message_number", "message_number", base.DEC),
    DPI_PID_index              = ProtoField.uint8("scte104.DPI_PID_index", "DPI_PID_index", base.HEX_DEC),
    SCTE35_protocol_version    = ProtoField.uint8("scte104.SCTE35_protocol_version", "SCTE35_protocol_version", base.DEC),
    timestamp_time_type        = ProtoField.uint8("scte104.timestamp.time_type", "time_type", base.DEC, TIME_TYPES),
    timestamp_UTC_seconds      = ProtoField.uint32("scte104.timestamp.UTC_seconds", "UTC_seconds", base.DEC),
    timestamp_UTC_microseconds = ProtoField.uint16("scte104.timestamp.UTC_microseconds", "UTC_microseconds", base.DEC),
    timestamp_VITC_hours       = ProtoField.uint8("scte104.timestamp.VITC_hours", "VITC_hours", base.DEC),
    timestamp_VITC_minutes     = ProtoField.uint8("scte104.timestamp.VITC_minutes", "VITC_minutes", base.DEC),
    timestamp_VITC_seconds     = ProtoField.uint8("scte104.timestamp.VITC_seconds", "VITC_seconds", base.DEC),
    timestamp_VITC_frames      = ProtoField.uint8("scte104.timestamp.VITC_frames", "VITC_frames", base.DEC),
    timestamp_GPI_number       = ProtoField.uint8("scte104.timestamp.GPI_number", "GPI_number", base.DEC),
    timestamp_GPI_edge         = ProtoField.uint8("scte104.timestamp.GPI_edge", "GPI_edge", base.DEC),
    num_ops                    = ProtoField.uint8("scte104.num_ops", "num_ops", base.DEC),
    sop_time                   = ProtoField.absolute_time("scte104.time", "time()", base.UTC),
    sop_time_seconds           = ProtoField.uint32("scte104.time_seconds", "seconds", base.DEC),
    sop_time_microseconds      = ProtoField.uint32("scte104.time_microseconds", "microseconds", base.DEC),
    cue_message_count          = ProtoField.uint8("scte104.cue_message_count", "cue_message_count", base.DEC),
    mopID                      = ProtoField.uint16("scte104.opID", "opID", base.HEX_DEC, OPID_MULTI_OP),
    data_length                = ProtoField.uint16("scte104.data_length", "data_length", base.DEC),
    opData                     = ProtoField.bytes("scte104.opData", "data()"),
    splice_insert_type         = ProtoField.uint8("scte104.splice_insert_type", "splice_insert_type", base.DEC,
        SPLICE_INSERT_TYPES),
    splice_event_id            = ProtoField.uint32("scte104.splice_event_id", "splice_event_id", base.DEC_HEX),
    unique_program_id          = ProtoField.uint16("scte104.unique_program_id", "unique_program_id", base.DEC_HEX),
    pre_roll_time              = ProtoField.relative_time("scte104.pre_roll_time", "pre_roll_time"),
    break_duration             = ProtoField.relative_time("scte104.break_duration", "break_duration"),
    avail_num                  = ProtoField.uint8("scte104.avail_num", "avail_num", base.DEC),
    avails_expected            = ProtoField.uint8("scte104.avails_expected", "avails_expected", base.DEC),
    auto_return_flag           = ProtoField.bool("scte104.auto_return_flag", "auto_return_flag"),
    not_an_entry_flag          = ProtoField.bool("scte104.not_an_entry_flag", "not_an_entry_flag"),
}
scte104_proto.fields = f

-- Expert Info Constants
local e = {
    msg_wrong_length = ProtoExpert.new(
        "scte104.malformed",
        "Message size exceeds captured length",
        expert.group.MALFORMED,
        expert.severity.ERROR
    ),
    out_of_range = ProtoExpert.new(
        "scte104.out_of_range",     -- (\___/)
        "Field value out of range", -- (='.'=)
        expert.group.MALFORMED,     -- (")_(")
        expert.severity.WARN
    )
}
scte104_proto.experts = e

function scte104_proto.dissector(buffer, pinfo, tree)
    if buffer:len() < 8 then return end

    pinfo.cols.protocol = "SCTE104"

    local opID = buffer(0, 2):uint()
    local messageSize = buffer(2, 2):uint()
    local MOP = (opID == 0xFFFF)
    local SOP = (opID ~= 0xFFFF)

    -- Single Operation Message
    local t = nil
    if (SOP) then
        t = tree:add(scte104_proto, buffer(),
            "SCTE-104 Single Operation Message: " .. (OPID_SINGLE_OP[opID] or "Unknown OPID"))
    else
        t = tree:add(scte104_proto, buffer(), "SCTE-104 Multiple Operation Message")
    end

    t:add(f.opID, buffer(0, 2))
    t:add(f.messageSize, buffer(2, 2))

    if (messageSize > buffer:len()) then
        t:add_proto_expert_info(e.msg_wrong_length)
        return
    end

    local message_number = 0
    if (SOP) then
        t:add(f.result, buffer(4, 2))
        t:add(f.result_extension, buffer(6, 2))
        t:add(f.protocol_version, buffer(8, 1))
        t:add(f.AS_index, buffer(9, 1))
        t:add(f.message_number, buffer(10, 1))
        message_number = buffer(10, 1):uint()
        t:add(f.DPI_PID_index, buffer(11, 2))

        -- fields based on message type:
        if (opID == 0x0003 or opID == 0x0004) then -- alive_request_data() or alive_response_data()
            if buffer:len() > 13 then              -- time() structure present
                Parse_time(buffer, 13, t)
            end
        elseif (opID == 0x0007) then -- inject_response_data()
            if buffer:len() >= 14 then
                t:add(scte104_proto, buffer(13, 1), "inject_response_data():")
                    :add(f.message_number, buffer(13, 1))
            else
                t:add_proto_expert_info(e.msg_wrong_length, "not enough data for inject_response_data()")
                return
            end
        elseif (opID == 0x0008) then -- inject_complete_response_data()
            if buffer:len() >= 15 then
                --local subt = t:add(scte104_proto, buffer(13,2), "inject_complete_response_data():")
                local subt = t:add(scte104_proto, buffer(13, 2), "inject_complete_response_data():")
                subt:add(f.message_number, buffer(13, 1))
                subt:add(f.cue_message_count, buffer(14, 1))
            else
                t:add_proto_expert_info(e.msg_wrong_length, "not enough data for inject_complete_response_data()")
                return
            end
        end
    else -- MOP
        t:add(f.protocol_version, buffer(4, 1))
        t:add(f.AS_index, buffer(5, 1))
        t:add(f.message_number, buffer(6, 1))
        message_number = buffer(6, 1):uint()
        t:add(f.DPI_PID_index, buffer(7, 2))
        t:add(f.SCTE35_protocol_version, buffer(9, 1))
        local pos = Parse_timestamp(buffer, 10, t)
        t:add(f.num_ops, buffer(pos, 1))
        pos = pos + 1
        local opNumber = 1
        while pos < messageSize and pos > 0 do
            pos = Parse_operation(buffer, pos, t, opNumber)
            opNumber = opNumber + 1
        end
    end

    -- Set the packet Info column
    if (opID == 0xFFFF) then
        pinfo.cols.info = string.format("MOP")
    else
        pinfo.cols.info = string.format("SOP msgNo:%d opID:0x%04X %s", message_number, opID, OPID_SINGLE_OP[opID] or "")
    end
end

---parses out operation  structure defined in Table 8-2
---returns the new offset after parsing time structure
---@param buffer Tvb
---@param offset number
---@param tree TreeItem
---@param opNumber number
---@return number
function Parse_operation(buffer, offset, tree, opNumber)
    if buffer:len() < offset + 4 then
        tree:add_proto_expert_info(e.msg_wrong_length, "not enough data for operation structure")
        return -1
    end
    local m_opID = buffer(offset, 2):uint()
    local data_length = buffer(offset + 2, 2):uint()
    local t = tree:add(scte104_proto,
        buffer(offset, math.min(buffer:len() - offset, 4 + data_length)),
        string.format("Operation %d: %s 0x%04x", opNumber, OPID_MULTI_OP[m_opID] or "Unknown", m_opID)
    )
    t:add(f.mopID, buffer(offset, 2))
    t:add(f.data_length, buffer(offset + 2, 2))
    if data_length > 0 then
        t:add(f.opData, buffer(offset + 4, math.min(data_length, buffer:len() - (offset + 4))))
    end

    -- parse the data based on type
    local data_offset = offset + 4
    if m_opID == 0x0101 then ------------------------------------------------------------------------ splice_request_data()
        if data_length < 14 then
            t:add_proto_expert_info(e.msg_wrong_length, "not enough data for splice_request_data()")
            return -1
        end
        t:add(f.splice_insert_type, buffer(data_offset, 1))
        t:append_text(string.format(": %s", SPLICE_INSERT_TYPES[buffer(data_offset, 1):uint()] or "unknown"))
        t:add(f.splice_event_id, buffer(data_offset + 1, 4))
        t:add(f.unique_program_id, buffer(data_offset + 5, 2))
        t:add(f.pre_roll_time, buffer(data_offset + 7, 2), NSTime.new(
            math.floor(buffer(data_offset + 7, 2):uint() / 1000), -- seconds
            (buffer(data_offset + 7, 2):uint() % 1000) * 1000000) -- nanoseconds
        )
        t:add(f.break_duration, buffer(data_offset + 9, 2), NSTime.new(
            math.floor(buffer(data_offset + 9, 2):uint() / 10), -- seconds
            (buffer(data_offset + 9, 2):uint() % 10) * 100000000) -- nanoseconds
        )
        t:add(f.avail_num, buffer(data_offset + 11, 1))
        t:add(f.avails_expected, buffer(data_offset + 12, 1))
        t:add(f.auto_return_flag, buffer(data_offset + 13, 1))
        if buffer:len() >= data_offset + 15 then
            t:add(f.not_an_entry_flag, buffer(data_offset + 14, 1)) -- this field is optional
        else
            t:add("not_an_entry_flag: 0 (not present)")            -- default to 0 if not present
        end
    elseif m_opID == 0x0104 then --------------------------------------------------------------- time_signal_request_data()
        if data_length ~= 2 then
            t:add_proto_expert_info(e.msg_wrong_length, "wrong data_length for time_signal_request_data()")
            return -1
        else
            local pre_roll = buffer(data_offset, 2):uint()
            t:append_text(string.format(": %d ms", pre_roll))
            t:add(f.pre_roll_time, buffer(data_offset, 2), NSTime.new(
                math.floor(pre_roll / 1000), -- seconds
                (pre_roll % 1000) * 1000000) -- nanoseconds
            )
        end
    end

    -- further dissection of sub-operations can be added here
    return offset + 4 + data_length
end

---parses out timestamp() structure defined in 12.4
---returns the new offset after parsing time structure
---@param buffer Tvb
---@param offset number
---@param tree TreeItem
---@return number
function Parse_timestamp(buffer, offset, tree)
    if buffer:len() < offset + 1 then
        tree:add_proto_expert_info(e.msg_wrong_length, "not enough data for timestamp() structure")
        return -1
    end
    local type = buffer(offset, 1):uint()
    if TIME_TYPE_LENGTHS[type] == nil then
        tree:add_proto_expert_info(e.out_of_range, "unknown time_type value in timestamp() structure")
        return -1
    end
    if buffer:len() < offset + TIME_TYPE_LENGTHS[type] then
        tree:add_proto_expert_info(e.msg_wrong_length, "not enough data for timestamp() structure")
        return -1
    end

    if type == 0 then -- No timestamp
        tree:add(scte104_proto, buffer(offset, 1), "timestamp(): No timestamp")
            :add(f.timestamp_time_type, buffer(offset, 1))
    elseif type == 1 then -- UTC
        local subt = tree:add(scte104_proto, buffer(offset, 7), "timestamp(): UTC")
        subt:add(f.timestamp_time_type, buffer(offset, 1))
        subt:add(f.timestamp_UTC_seconds, buffer(offset + 1, 4))
        subt:add(f.timestamp_UTC_microseconds, buffer(offset + 5, 2))
        local microseconds = buffer(offset + 5, 2):uint()
        if microseconds >= 1000000 then
            subt:add_proto_expert_info(e.out_of_range, "UTC microseconds field out of range")
        end
    elseif type == 2 then -- VITC
        local subt = tree:add(scte104_proto, buffer(offset, 5), "timestamp(): VITC")
        subt:add(f.timestamp_time_type, buffer(offset, 1))
        subt:add(f.timestamp_VITC_hours, buffer(offset + 1, 1))
        subt:add(f.timestamp_VITC_minutes, buffer(offset + 2, 1))
        subt:add(f.timestamp_VITC_seconds, buffer(offset + 3, 1))
        subt:add(f.timestamp_VITC_frames, buffer(offset + 4, 1))
    elseif type == 3 then -- GPI
        local subt = tree:add(scte104_proto, buffer(offset, 3), "timestamp(): GPI")
        subt:add(f.timestamp_time_type, buffer(offset, 1))
        subt:add(f.timestamp_GPI_number, buffer(offset + 1, 1))
        subt:add(f.timestamp_GPI_edge, buffer(offset + 2, 1))
    end
    return offset + TIME_TYPE_LENGTHS[type]
end

---parses out time() structure defined in 12.4
---returns the new offset after parsing time structure
---@param buffer Tvb
---@param offset number
---@param tree TreeItem
---@return number
function Parse_time(buffer, offset, tree)
    if buffer:len() < offset + 8 then
        tree:add_proto_expert_info(e.msg_wrong_length, "not enough data for time() structure")
        return offset
    end

    local seconds = buffer(offset, 4):uint()
    local microseconds = buffer(offset + 4, 4):uint()
    local t = NSTime.new(
        seconds + 315964800,                -- some weird number of seconds between Unix Epoch and NTP epoch
        --buffer(offset, 4):uint() + 315964782, -- Middleman is 18 seconds off from this. Possibly 9 leap seconds he's off and 9 seconds Austronaut is off?
        buffer(offset + 4, 4):uint() * 1000 -- microseconds to nanoseconds
    )
    local subt = tree:add(f.sop_time, buffer(offset, 8), t)
    subt:add(f.sop_time_seconds, buffer(offset, 4))
    subt:add(f.sop_time_microseconds, buffer(offset + 4, 4))
    if microseconds >= 1000000 then
        subt:add_proto_expert_info(e.out_of_range, "microseconds field out of range")
    end
    return offset + 8
end

-- Register dissector to TCP port (example: 5167)
local tcp_port = DissectorTable.get("tcp.port")
if tcp_port then
    tcp_port:add(5167, scte104_proto)
end


-- require("wireshark-lua-api.NSTime")
set_plugin_info({
    version = "1.0.0",
    description = "SCTE-104 Protocol Dissector",
    author = "Dimitri Tarassenko",
    repository = "https://github.com/m1tk4/wireshark-scte"
})


-- SCTE-104 TCP Lua Dissector with SPLICE_REQUEST_DATA parsing + lookup tables

local scte104_proto = Proto("scte104", "SCTE-104 Protocol")

-- Header fields
local f_msg_len   = ProtoField.uint16("scte104.msg_len", "Message Length", base.DEC)
local f_protocol  = ProtoField.uint8("scte104.protocol_version", "Protocol Version", base.DEC)
local f_msg_type  = ProtoField.uint8("scte104.msg_type", "Message Type", base.DEC)
local f_opid      = ProtoField.uint16("scte104.opid", "Operation ID", base.DEC)


-- Lookup table for splice_insert_type (Table 8-6)
local splice_type_vals = {
    [0] = "Splice Null",
    [1] = "Splice Insert (Avail)",
    [2] = "Insert Descriptor",
    [3] = "Insert DTMF Descriptor",
    [4] = "Insert Avail Descriptor",
    [5] = "Insert Tier",
    [255] = "Proprietary Command"
}

-- Splice Request fields (namespaced under scte104.splice.*)
local f_splice_type    = ProtoField.uint8("scte104.splice.type", "Splice Insert Type", base.DEC, splice_type_vals)
local f_event_id       = ProtoField.uint32("scte104.splice.event_id", "Splice Event ID", base.DEC)
local f_program_id     = ProtoField.uint16("scte104.splice.program_id", "Unique Program ID", base.DEC)
local f_pre_roll       = ProtoField.uint16("scte104.splice.pre_roll_time", "Pre-roll Time (ms)", base.DEC)
local f_break_duration = ProtoField.uint16("scte104.splice.break_duration", "Break Duration (s)", base.DEC)
local f_in_flag        = ProtoField.uint8("scte104.splice.in_flag", "In Point Flag", base.DEC)
local f_out_flag       = ProtoField.uint8("scte104.splice.out_flag", "Out Point Flag", base.DEC)

scte104_proto.fields = {
    f_msg_len, f_protocol, f_msg_type, f_opid,
    f_splice_type, f_event_id, f_program_id,
    f_pre_roll, f_break_duration, f_in_flag, f_out_flag
}


local f = ENC_ANTI_HOST_ENDIAN



function scte104_proto.dissector(buffer, pinfo, tree)
    

    if buffer:len() < 8 then return end

    local subtree = tree:add(scte104_proto, buffer(), "SCTE-104 Message")

    subtree:add(f_msg_len, buffer(0,2))
    subtree:add(f_protocol, buffer(2,1))
    subtree:add(f_msg_type, buffer(3,1))
    subtree:add(f_opid, buffer(4,2))

    local msg_type = buffer(3,1):uint()
    local opid     = buffer(4,2):uint()

    -- Example: OPID for Splice Request (commonly 0x0100)
    if opid == 0x0100 then
        local splice_tree = subtree:add(scte104_proto, buffer(6), "Splice Request Data")

        splice_tree:add(f_splice_type, buffer(6,1))
        splice_tree:add(f_event_id, buffer(7,4))
        splice_tree:add(f_program_id, buffer(11,2))
        splice_tree:add(f_pre_roll, buffer(13,2))
        splice_tree:add(f_break_duration, buffer(15,2))
        splice_tree:add(f_in_flag, buffer(17,1))
        splice_tree:add(f_out_flag, buffer(18,1))

        pinfo.cols.info = string.format("SpliceReq: Event=%d, Program=%d, Type=%s",
            buffer(7,4):uint(),
            buffer(11,2):uint(),
            splice_type_vals[buffer(6,1):uint()] or "Unknown")
    else
        pinfo.cols.info = string.format("MsgType=%d, OPID=%d WTF23", msg_type, opid)
    end
end

-- Register dissector to TCP port (example: 5167) 
local tcp_port = DissectorTable.get("tcp.port")
if tcp_port then 
    tcp_port:add(5167, scte104_proto)
end

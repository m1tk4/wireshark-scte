--[[

    SCTE-104 TCP Lua Dissector with SPLICE_REQUEST_DATA parsing + lookup tables

]]--

set_plugin_info({
    version = "1.0.0",
    description = "SCTE-104 Protocol Dissector",
    author = "Dimitri Tarassenko",
    repository = "https://github.com/m1tk4/wireshark-scte"
})


local scte104_proto = Proto("scte104", "SCTE-104 Protocol")

-- Header fields
local f_msg_len   = ProtoField.uint16("scte104.msg_len", "Message Length", base.DEC)
local f_protocol  = ProtoField.uint8("scte104.protocol_version", "Protocol Version", base.DEC)
local f_msg_type  = ProtoField.uint8("scte104.msg_type", "Message Type", base.DEC)
local f_opid      = ProtoField.uint16("scte104.opid", "Operation ID", base.HEX_DEC)


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

local f = {
    pre = ProtoField.uint8("scte104.splice.pre", "Pre", base.DEC),
    post = ProtoField.uint8("scte104.splice.post", "Post", base.DEC)
}



scte104_proto.fields = {
    f_msg_len, f_protocol, f_msg_type, f_opid,
    f_splice_type, f_event_id, f_program_id,
    f_pre_roll, f_break_duration, f_in_flag, f_out_flag, f.pre, f.post
}


local f = ENC_ANTI_HOST_ENDIAN



function scte104_proto.dissector(buffer, pinfo, tree)
    

    if buffer:len() < 8 then return end

    local subtree = tree:add(scte104_proto, buffer(), "SCTE-104 Message")

    subtree:add(f_msg_len, buffer:range(0,2))
    subtree:add_packet_field(f_msg_len, buffer(0,2), ENC_BIG_ENDIAN)
    subtree:add(f_protocol, buffer(2,1))
    subtree:add(f_msg_type, buffer(3,1))
    
    -- all of these are actually valid
    subtree:add(f_opid, buffer:range(4,2))
    subtree:add(f_opid, 0xFFFFF)
    -- subtree:add(f_opid, "something") -- this fails
    -- subtree:add(f_opid, buffer(4,2), "something") -- this fails too
    subtree:add("ddede") -- valid use of just a label, but not parsed correctly
    --[[
    subtree:add(0x32232,"3322","dede")
    subtree:add(0x32232,"3322")
    subtree:add(43.434*212,"floast")
    subtree:add("floast", 43.434*212+22)
    subtree:add("bool", true, 3 ,"dede") -- boolean will be omitted but doesn't error
        :add("dede"):prepend_text("prefix ")
    subtree:add("ddd", buffer:range(0,2):int(),"de")
    ]]--

    subtree:add("expert:"):add_expert_info(PI_CHECKSUM, expert.severity.ERROR, "checksum error lalala")


    
    local msg_type = buffer(3,1):uint()
    local opid     = buffer(4,2):uint()

    -- Example: OPID for Splice Request (commonly 0x0100)
    if opid == 0x0100 then
        local splice_tree = subtree:add(scte104_proto, buffer(6), "Splice Request Data") -- 3- parameter variant with Proto!

        splice_tree:add(f_splice_type, buffer(6,1))
        splice_tree:add(buffer(6,1),buffer(3,3))
        splice_tree:add(f_event_id, buffer(7,4))
        splice_tree:add(f_program_id, buffer(11,2))
        splice_tree:add(f_pre_roll, buffer(13,2))
        splice_tree:add(f_break_duration, buffer(15,2))
        splice_tree:add(f_in_flag, buffer(17,1))
        splice_tree:add(f_out_flag, buffer(18,1))

        local d = buffer:range(6, 12)
        
        pinfo.cols.info = string.format("SpliceReq: Event=%d, Program=%d, Type=%s",
            buffer(7,4):uint(),
            buffer(11,2):uint(),
            splice_type_vals[buffer(6,1):uint()] or "Unknown")
    else 
        local some_tree = subtree:add(scte104_proto, buffer(6), "Data") -- 3- parameter variant with Proto!
        some_tree:add("some stuff")
        :add(f_splice_type, buffer(6,1))
        :add(f_event_id, buffer(7,4))
        pinfo.cols.info = string.format("MsgType=%d, OPID=%d WTF2ee3", msg_type, opid+1)
    end
end

-- Register dissector to TCP port (example: 5167) 
local tcp_port = DissectorTable.get("tcp.port")
if tcp_port then 
    tcp_port:add(5167, scte104_proto)
end

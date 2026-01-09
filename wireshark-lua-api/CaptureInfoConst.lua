---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_File.html#lua_class_CaptureInfoConst

---@class CaptureInfoConst
---A CaptureInfoConst object, passed into Lua as an argument to the FileHandler callback function write_open().
---This object represents capture file data and meta-data (data about the capture file) for the current capture in Wireshark/TShark.
---This object's fields are read-from when used by write_open function callback.
CaptureInfoConst = {}

---Generates a string of debug info for the CaptureInfoConst.
---@return string debug String of debug information.
function CaptureInfoConst:__tostring() end

---The file type.
---@type number
CaptureInfoConst.type = 0

---The maximum packet length that is actually recorded (vs. the original length of any given packet on-the-wire).
---A value of 0 means the snapshot length is unknown or there is no one such length for the whole file.
---@type number
CaptureInfoConst.snapshot_length = 0

---The packet encapsulation type for the whole file.
---See wtap_encaps for available types. It is set to wtap_encaps.PER_PACKET if packets can have different types,
---in which case each Frame identifies its type, in FrameInfo.packet_encap.
---@type number
CaptureInfoConst.encap = 0

---A comment for the whole capture file, if the wtap_presence_flags.COMMENTS was set in the presence flags; nil if there is no comment.
---@type string|nil
CaptureInfoConst.comment = nil

---A string containing the description of the hardware used to create the capture, or nil if there is no hardware string.
---@type string|nil
CaptureInfoConst.hardware = nil

---A string containing the name of the operating system used to create the capture, or nil if there is no os string.
---@type string|nil
CaptureInfoConst.os = nil

---A string containing the name of the application used to create the capture, or nil if there is no user_app string.
---@type string|nil
CaptureInfoConst.user_app = nil

---A ip-to-hostname Lua table of two key-ed names: ipv4_addresses and ipv6_addresses.
---The value of each of these names are themselves array tables, of key-ed tables,
---such that the inner table has a key addr set to the raw 4-byte or 16-byte IP address Lua string and a name set to the resolved name.
---Example: { ipv4_addresses = { { addr = "\01\02\03\04", name = "foo.com" } }, ipv6_addresses = { } }
---Note that either the ipv4_addresses or the ipv6_addresses table, or both, may be empty, however they will not be nil.
---@type table
CaptureInfoConst.hosts = {}

---A private Lua value unique to this file.
---The private_table is a field you set/get with your own Lua table. This is provided so that a Lua script can save per-file reading/writing state,
---because multiple files can be opened and read at the same time.
---@type table|nil
CaptureInfoConst.private_table = nil

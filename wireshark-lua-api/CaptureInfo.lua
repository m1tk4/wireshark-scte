---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_File.html#lua_class_CaptureInfo

---@class CaptureInfo
---A CaptureInfo object, passed into Lua as an argument by FileHandler callback function read_open(), read(), seek_read(), seq_read_close(), and read_close().
---This object represents capture file data and meta-data (data about the capture file) being read into Wireshark/TShark.
---This object's fields can be written-to by Lua during the read-based function callbacks.
CaptureInfo = {}

---Generates a string of debug info for the CaptureInfo.
---@return string debug String of debug information.
function CaptureInfo:__tostring() end

---The packet encapsulation type for the whole file.
---See wtap_encaps for available types. Set to wtap_encaps.PER_PACKET if packets can have different types,
---then later set FrameInfo.encap for each packet during read()/seek_read().
---@type number
CaptureInfo.encap = 0

---The precision of the packet timestamps in the file.
---See wtap_file_tsprec for available precisions.
---@type number
CaptureInfo.time_precision = 0

---The maximum packet length that could be recorded.
---Setting it to 0 means unknown.
---@type number
CaptureInfo.snapshot_length = 0

---A string comment for the whole capture file, or nil if there is no comment.
---@type string|nil
CaptureInfo.comment = nil

---A string containing the description of the hardware used to create the capture, or nil if there is no hardware string.
---@type string|nil
CaptureInfo.hardware = nil

---A string containing the name of the operating system used to create the capture, or nil if there is no os string.
---@type string|nil
CaptureInfo.os = nil

---A string containing the name of the application used to create the capture, or nil if there is no user_app string.
---@type string|nil
CaptureInfo.user_app = nil

---Sets resolved ip-to-hostname information.
---The value set must be a Lua table of two key-ed names: ipv4_addresses and ipv6_addresses.
---The value of each of these names are themselves array tables, of key-ed tables,
---such that the inner table has a key addr set to the raw 4-byte or 16-byte IP address Lua string and a name set to the resolved name.
---Example: { ipv4_addresses = { { addr = "\01\02\03\04", name = "foo.com" } } }
---@type table|nil
CaptureInfo.hosts = nil

---A private Lua value unique to this file.
---The private_table is a field you set/get with your own Lua table. This is provided so that a Lua script can save per-file reading/writing state,
---because multiple files can be opened and read at the same time.
---@type table|nil
CaptureInfo.private_table = nil

---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_File.html#lua_class_FrameInfo

---@class FrameInfo
---A FrameInfo object, passed into Lua as an argument by FileHandler callback functions (e.g., read, seek_read, etc.).
---This object represents frame data and meta-data (data about the frame/packet) for a given read/seek_read/write's frame.
---This object's fields are written-to/set when used by read function callbacks, and read-from/get when used by file write function callbacks.
FrameInfo = {}

---Generates a string of debug info for the FrameInfo.
---@return string debug String of debug information.
function FrameInfo:__tostring() end

---Calls wtap_setup_packet_rec().
---@param encap number The encapsulation type to use.
function FrameInfo:setup_packet_rec(encap) end

---Tells Wireshark to read directly from given file into frame data buffer, for length bytes.
---Returns true if succeeded, else false.
---@param file File The File object userdata, provided by Wireshark previously in a reading-based callback.
---@param length number The number of bytes to read from the file at the current cursor position.
---@return boolean success True if succeeded, else returns false along with the error number and string error description.
function FrameInfo:read_data(file, length) end

---Table of comments in this frame.
---@type table|nil
FrameInfo.comment = nil

---The packet timestamp as an NSTime object.
---Note: Set the FileHandler.time_precision to the appropriate wtap_file_tsprec value as well.
---@type NSTime
FrameInfo.time = nil

---The data buffer containing the packet.
---Note: This cannot be cleared once set.
---@type ByteArray
FrameInfo.data = nil

---The record type of the packet frame.
---See wtap_rec_types for values.
---@type number
FrameInfo.rec_type = 0

---The presence flags of the packet frame.
---See wtap_presence_flags for bit values.
---@type number
FrameInfo.flags = 0

---The captured packet length, and thus the length of the buffer passed to the FrameInfo.data field.
---@type number
FrameInfo.captured_length = 0

---The on-the-wire packet length, which may be longer than the captured_length.
---@type number
FrameInfo.original_length = 0

---The packet encapsulation type for the frame/packet, if the file supports per-packet types.
---See wtap_encaps for possible packet encapsulation types to use as the value for this field.
---@type number
FrameInfo.encap = 0

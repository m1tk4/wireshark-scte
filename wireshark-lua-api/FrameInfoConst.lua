---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_File.html#lua_class_FrameInfoConst

---@class FrameInfoConst
---A constant FrameInfo object, passed into Lua as an argument by the FileHandler write callback function.
---This has similar attributes/properties as FrameInfo, but the fields can only be read from, not written to.
FrameInfoConst = {}

---Generates a string of debug info for the FrameInfo.
---@return string debug String of debug information.
function FrameInfoConst:__tostring() end

---Tells Wireshark to write directly to given file from the frame data buffer, for length bytes.
---Returns true if succeeded, else false.
---@param file File The File object userdata, provided by Wireshark previously in a writing-based callback.
---@param length? number Optional. The number of bytes to write to the file at the current cursor position, or all if not supplied.
---@return boolean success True if succeeded, else returns false along with the error number and string error description.
function FrameInfoConst:write_data(file, length) end

---The first string comment for the packet, if any; nil if there is no comment.
---@type string|nil
FrameInfoConst.comment = nil

---The packet timestamp as an NSTime object.
---@type NSTime
FrameInfoConst.time = nil

---The data buffer containing the packet.
---@type ByteArray
FrameInfoConst.data = nil

---The record type of the packet frame - see wtap_presence_flags for values.
---@type number
FrameInfoConst.rec_type = 0

---The presence flags of the packet frame - see wtap_presence_flags for bits.
---@type number
FrameInfoConst.flags = 0

---The captured packet length, and thus the length of the buffer in the FrameInfoConst.data field.
---@type number
FrameInfoConst.captured_length = 0

---The on-the-wire packet length, which may be longer than the captured_length.
---@type number
FrameInfoConst.original_length = 0

---The packet encapsulation type, if the file supports per-packet types.
---See wtap_encaps for possible packet encapsulation types to use as the value for this field.
---@type number
FrameInfoConst.encap = 0

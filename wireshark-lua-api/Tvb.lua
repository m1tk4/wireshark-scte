---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Tvb.html

---@class Tvb
---A Tvb represents the packet's buffer. It is passed as an argument to listeners and dissectors.
---Tvbs are usable only by the current listener or dissector call and are destroyed as soon as the listener or dissector returns.
Tvb = {}

---Convert the bytes of a Tvb into a string. This is primarily useful for debugging purposes since the string will be truncated if it is too long.
---@return string str The string.
function Tvb:__tostring() end

---Obtain the reported length (length on the network) of a Tvb.
---@return number length The reported length of the Tvb.
function Tvb:reported_len() end

---Obtain the captured length (amount saved in the capture process) of a Tvb.
---@return number length The captured length of the Tvb.
function Tvb:captured_len() end

---Obtain the captured length (amount saved in the capture process) of a Tvb. Same as captured_len; kept only for backwards compatibility.
---@return number length The captured length of the Tvb.
function Tvb:len() end

---Obtain the reported (not captured) length of packet data to end of a Tvb or 0 if the offset is beyond the end of the Tvb.
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@return number length The remaining reported length of the Tvb.
function Tvb:reported_length_remaining(offset) end

---Obtain a ByteArray from a Tvb.
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to until the end of the Tvb.
---@return ByteArray|nil bytearray The ByteArray object or nil.
function Tvb:bytes(offset, length) end

---Returns the raw offset (from the beginning of the source Tvb) of a sub Tvb.
---@return number offset The raw offset of the Tvb.
function Tvb:offset() end

---Equivalent to tvb:range(...)
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to -1, which specifies the remaining bytes in the Tvb.
---@return TvbRange range The TvbRange.
function Tvb:__call(offset, length) end

---Creates a TvbRange from this Tvb.
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to -1, which specifies the remaining bytes in the Tvb.
---@return TvbRange range The TvbRange.
function Tvb:range(offset, length) end

---Obtain a Lua string of the binary bytes in a Tvb.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the segment to get. Default is -1, or the remaining bytes in the Tvb.
---@return string str A Lua string of the binary bytes in the Tvb.
function Tvb:raw(offset, length) end

---Checks whether contents of two Tvbs are equal.
---@return boolean
function Tvb:__eq() end

---Equivalent to tvb:range(...)
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to -1, which specifies the remaining bytes in the Tvb.
---@return TvbRange range The TvbRange.
function Tvb(offset, length) end


local function Tvb__test__()
    local tvb = Tvb(3,2):range(0,5)
    local a = tvb:range(0, 10)
end
---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Tvb.html#lua_class_ByteArray

---@class ByteArray
---A ByteArray is a sequence of bytes used for handling binary data.
ByteArray = {}

---Creates a new ByteArray object.
---If the second argument is boolean true, the first argument is treated as raw binary data instead of hex string.
---@param hexbytes? string A string consisting of hexadecimal bytes like "00 B1 A2" or "1a2b3c4d".
---@param separator? string|boolean A string separator between hex bytes/words (default=" "), or if boolean true then first arg is treated as raw binary data.
---@return ByteArray bytearray The new ByteArray object.
function ByteArray.new(hexbytes, separator) end

---Concatenate two ByteArrays.
---@param first ByteArray First array.
---@param second ByteArray Second array.
---@return ByteArray bytearray The new composite ByteArray.
function ByteArray:__concat(first, second) end

---Compares two ByteArray values.
---@param first ByteArray First array.
---@param second ByteArray Second array.
---@return boolean
function ByteArray:__eq(first, second) end

---Prepend a ByteArray to this ByteArray.
---@param prepended ByteArray ByteArray to be prepended.
function ByteArray:prepend(prepended) end

---Append a ByteArray to this ByteArray.
---@param appended ByteArray ByteArray to be appended.
function ByteArray:append(appended) end

---Sets the size of a ByteArray, either truncating it or filling it with zeros.
---@param size number New size of the array.
function ByteArray:set_size(size) end

---Sets the value of an index of a ByteArray.
---@param index number The position of the byte to be set.
---@param value number The char value to set [0-255].
function ByteArray:set_index(index, value) end

---Get the value of a byte in a ByteArray.
---@param index number The position of the byte to get.
---@return number value The value [0-255] of the byte.
function ByteArray:get_index(index) end

---Read a little endian encoded signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the little endian encoded signed integer.
function ByteArray:le_int(offset, length) end

---Read a little endian encoded 64 bit signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return Int64 value The value as an Int64 object.
function ByteArray:le_int64(offset, length) end

---Read a little endian encoded unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the little endian encoded unsigned integer.
function ByteArray:le_uint(offset, length) end

---Read a little endian encoded 64 bit unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return UInt64 value The value as a UInt64 object.
function ByteArray:le_uint64(offset, length) end

---Read a big endian encoded signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the big endian encoded 32 bit signed integer.
function ByteArray:int(offset, length) end

---Read a big endian encoded 64 bit signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return Int64 value The value as an Int64 object.
function ByteArray:int64(offset, length) end

---Read a big endian encoded unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the big endian encoded 32 bit unsigned integer.
function ByteArray:uint(offset, length) end

---Read a big endian encoded 64 bit unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return UInt64 value The value as a UInt64 object.
function ByteArray:uint64(offset, length) end

---Obtain the length of a ByteArray.
---@return number length The length of the ByteArray.
function ByteArray:len() end

---Obtain a segment of a ByteArray, as a new ByteArray.
---@param offset number The position of the first byte (0=first).
---@param length number The length of the segment.
---@return ByteArray bytearray A ByteArray containing the requested segment.
function ByteArray:subset(offset, length) end

---Obtain a Base64 decoded ByteArray.
---@return ByteArray bytearray The created ByteArray.
function ByteArray:base64_decode() end

---Obtain a Lua string of the binary bytes in a ByteArray.
---@param offset? number The position of the first byte (default=0/first).
---@param length? number The length of the segment to get (default=all).
---@return string bytes A Lua string of the binary bytes in the ByteArray.
function ByteArray:raw(offset, length) end

---Obtain a Lua string of the bytes in a ByteArray as hex-ascii, with given separator.
---@param lowercase? boolean True to use lower-case hex characters (default=false).
---@param separator? string A string separator to insert between hex bytes (default=nil).
---@return string hex A hex-ascii string representation of the ByteArray.
function ByteArray:tohex(lowercase, separator) end

---Obtain a Lua string containing the bytes in a ByteArray so that it can be used in display filters.
---@return string hex A hex-ascii string representation of the ByteArray.
function ByteArray:__tostring() end

---Creates a new Tvb from a ByteArray. The Tvb will be added to the current frame.
---@param name string The name to be given to the new data source.
---@return Tvb tvb The created Tvb.
function ByteArray:tvb(name) end

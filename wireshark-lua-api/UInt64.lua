-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Int64.html

---@class UInt64
---UInt64 represents a 64 bit unsigned integer.
UInt64 = {}

---Decodes an 8-byte Lua binary string, using given endianness, into a new UInt64 object.
---@param string string The Lua string containing a binary 64-bit integer.
---@param endian? boolean If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return UInt64|nil uint64 The UInt64 object created, or nil on failure.
function UInt64.decode(string, endian)
    return nil
end

---Creates a UInt64 object.
---@param value? number|UInt64|Int64|string A number, UInt64, Int64, or string of digits to assign the value of the new UInt64. Default is 0.
---@param highvalue? number If this is a number and the first argument was a number, then the first will be treated as a lower 32 bits, and this is the high-order 32-bit number.
---@return UInt64 uint64 The new UInt64 object.
function UInt64.new(value, highvalue)
    return UInt64(0)
end

---Creates a UInt64 of the maximum possible value (18,446,744,073,709,551,615).
---@return UInt64 uint64 The maximum value.
function UInt64.max()
    return UInt64(0)
end

---Creates a UInt64 of the minimum possible value (0).
---@return UInt64 uint64 The minimum value.
function UInt64.min()
    return UInt64(0)
end

---Creates a UInt64 object from the given hex string.
---@param hex string The hex-ASCII Lua string.
---@return UInt64 uint64 The new UInt64 object.
function UInt64.fromhex(hex)
    return UInt64(0)
end

---Encodes the UInt64 number into an 8-byte Lua binary string, using given endianness.
---@param endian? boolean If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return string str The Lua binary string.
function UInt64:encode(endian)
    return ""
end

---Creates a UInt64 object.
---@return UInt64 uint64 The new UInt64 object.
function UInt64:__call()
    return UInt64(0)
end

---Returns a Lua number of the UInt64 value. This may lose precision.
---@return number num The Lua number.
function UInt64:tonumber()
    return 0
end

---Converts the UInt64 into a string.
---@return string str The Lua string.
function UInt64:__tostring()
    return ""
end

---Returns a hex string of the UInt64 value.
---@param numbytes? number The number of hex-chars/nibbles to generate. Negative means uppercase Default is 16.
---@return string hex The string hex.
function UInt64:tohex(numbytes)
    return ""
end

---Returns a Lua number of the higher 32 bits of the UInt64 value.
---@return number num The Lua number.
function UInt64:higher()
    return 0
end

---Returns a Lua number of the lower 32 bits of the UInt64 value.
---@return number num The Lua number.
function UInt64:lower()
    return 0
end

---Returns the UInt64 in a new UInt64, since unsigned integers can't be negated.
---@return UInt64 uint64 The UInt64 object.
function UInt64:__unm()
    return UInt64(0)
end

---Adds two UInt64 together and returns a new one. This may wrap the value.
---@return UInt64 uint64 The new UInt64.
function UInt64:__add()
    return UInt64(0)
end

---Subtracts two UInt64 and returns a new one. This may wrap the value.
---@return UInt64 uint64 The new UInt64.
function UInt64:__sub()
    return UInt64(0)
end

---Multiplies two UInt64 and returns a new one. This may truncate the value.
---@return UInt64 uint64 The new UInt64.
function UInt64:__mul()
    return UInt64(0)
end

---Divides two UInt64 and returns a new one. Integer divide, no remainder.
---@return UInt64 uint64 The UInt64 result.
function UInt64:__div()
    return UInt64(0)
end

---Divides two UInt64 and returns a new one of the remainder.
---@return UInt64 uint64 The UInt64 result.
function UInt64:__mod()
    return UInt64(0)
end

---The first UInt64 is taken to the power of the second UInt64/number, returning a new one.
---@return UInt64 uint64 The UInt64 object.
function UInt64:__pow()
    return UInt64(0)
end

---Returns true if both UInt64 are equal.
---@return boolean
function UInt64:__eq()
    return false
end

---Returns true if first UInt64 is less than the second.
---@return boolean
function UInt64:__lt()
    return false
end

---Returns true if first UInt64 is less than or equal to the second.
---@return boolean
function UInt64:__le()
    return false
end

---Returns a UInt64 of the bitwise 'not' operation.
---@return UInt64 uint64 The UInt64 object.
function UInt64:bnot()
    return UInt64(0)
end

---Returns a UInt64 of the bitwise 'and' operation, with the given number/Int64/UInt64.
---@return UInt64 uint64 The UInt64 object.
function UInt64:band()
    return UInt64(0)
end

---Returns a UInt64 of the bitwise 'or' operation, with the given number/Int64/UInt64.
---@return UInt64 uint64 The UInt64 object.
function UInt64:bor()
    return UInt64(0)
end

---Returns a UInt64 of the bitwise 'xor' operation, with the given number/Int64/UInt64.
---@return UInt64 uint64 The UInt64 object.
function UInt64:bxor()
    return UInt64(0)
end

---Returns a UInt64 of the bitwise logical left-shift operation, by the given number of bits.
---@param numbits number The number of bits to left-shift by.
---@return UInt64 uint64 The UInt64 object.
function UInt64:lshift(numbits)
    return UInt64(0)
end

---Returns a UInt64 of the bitwise logical right-shift operation, by the given number of bits.
---@param numbits number The number of bits to right-shift by.
---@return UInt64 uint64 The UInt64 object.
function UInt64:rshift(numbits)
    return UInt64(0)
end

---Returns a UInt64 of the bitwise arithmetic right-shift operation, by the given number of bits.
---@param numbits number The number of bits to right-shift by.
---@return UInt64 uint64 The UInt64 object.
function UInt64:arshift(numbits)
    return UInt64(0)
end

---Returns a UInt64 of the bitwise left rotation operation, by the given number of bits (up to 63).
---@param numbits number The number of bits to roll left by.
---@return UInt64 uint64 The UInt64 object.
function UInt64:rol(numbits)
    return UInt64(0)
end

---Returns a UInt64 of the bitwise right rotation operation, by the given number of bits (up to 63).
---@param numbits number The number of bits to roll right by.
---@return UInt64 uint64 The UInt64 object.
function UInt64:ror(numbits)
    return UInt64(0)
end

---Returns a UInt64 of the bytes swapped. This can be used to convert little-endian 64-bit numbers to big-endian 64 bit numbers or vice versa.
---@return UInt64 uint64 The UInt64 object.
function UInt64:bswap()
    return UInt64(0)
end

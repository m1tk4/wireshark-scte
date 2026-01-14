---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Int64.html

---@class Int64
---Int64 represents a 64 bit signed integer.
---@overload fun(): Int64
---@operator unm(): Int64
---@operator add(Int64): Int64
---@operator sub(Int64): Int64
---@operator mul(Int64): Int64
---@operator div(Int64): Int64
---@operator mod(Int64): Int64
---@operator pow(Int64): Int64
---@operator bnot(): Int64
---@operator band(Int64): Int64
---@operator bor(Int64): Int64
---@operator bxor(Int64): Int64
---@operator shl(number): Int64
---@operator shr(number): Int64
Int64 = {}

---Decodes an 8-byte Lua string, using the given endianness, into a new Int64 object.
---@param string string The Lua string containing a binary 64-bit integer.
---@param endian? boolean If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return Int64|nil int64 The Int64 object created, or nil on failure.
function Int64.decode(string, endian) end

---Creates a Int64 object.
---@param value? number|Int64|UInt64|string A number, UInt64, Int64, or string of ASCII digits to assign the value of the new Int64. Default is 0.
---@param highvalue? number If this is a number and the first argument was a number, then the first will be treated as a lower 32 bits, and this is the high-order 32 bit number.
---@return Int64 int64 The new Int64 object.
function Int64.new(value, highvalue) end

---Creates an Int64 of the maximum possible positive value (9,223,372,036,854,775,807).
---@return Int64 int64 The new Int64 object of the maximum value.
function Int64.max() end

---Creates an Int64 of the minimum possible negative value (-9,223,372,036,854,775,808).
---@return Int64 int64 The new Int64 object of the minimum value.
function Int64.min() end

---Creates an Int64 object from the given hexadecimal string.
---@param hex string The hex-ASCII Lua string.
---@return Int64 int64 The new Int64 object.
function Int64.fromhex(hex) end

---Encodes the Int64 number into an 8-byte Lua string using the given endianness.
---@param endian? boolean If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return string str The Lua string.
function Int64:encode(endian) end

---Creates a Int64 object.
---@return Int64 int64 The new Int64 object.
function Int64:__call() end

---Returns a Lua number of the Int64 value. Note that this may lose precision.
---@return number num The Lua number.
function Int64:tonumber() end

---Returns a hexadecimal string of the Int64 value.
---@param numbytes? number The number of hex chars/nibbles to generate. A negative value generates uppercase. Default is 16.
---@return string hex The string hex.
function Int64:tohex(numbytes) end

---Returns a Lua number of the higher 32 bits of the Int64 value. A negative Int64 will return a negative Lua number.
---@return number num The Lua number.
function Int64:higher() end

---Returns a Lua number of the lower 32 bits of the Int64 value. This will always be positive.
---@return number num The Lua number.
function Int64:lower() end

---Converts the Int64 into a string of decimal digits.
---@return string str The Lua string.
function Int64:__tostring() end

---Returns the negative of the Int64 as a new Int64.
---@return Int64 int64 The new Int64.
function Int64:__unm() end

---Adds two Int64 together and returns a new one. The value may wrapped.
---@param j Int64 The Int64 to add.
---@return Int64 int64 The new Int64.
function Int64:__add(j) end

---Subtracts two Int64 and returns a new one. The value may wrapped.
---@param j Int64 The Int64 to subtract.
---@return Int64 int64 The new Int64.
function Int64:__sub(j) end

---Multiplies two Int64 and returns a new one. The value may truncated.
---@param j Int64 The Int64 to multiply.
---@return Int64 int64 The new Int64.
function Int64:__mul(j) end

---Divides two Int64 and returns a new one. Integer divide, no remainder.
---@param j Int64 The Int64 to divide by.
---@return Int64 int64 The Int64 object.
function Int64:__div(j) end

---Divides two Int64 and returns a new one of the remainder.
---@return Int64 int64 The Int64 object.
---@param j Int64 The Int64 to divide by.
function Int64:__mod(j) end

---The first Int64 is taken to the power of the second Int64, returning a new one.
---@return Int64 int64 The Int64 object.
---@param j Int64 The Int64 exponent.
function Int64:__pow(j) end

---Returns true if both Int64 are equal.
---@return boolean
---@param j Int64 The Int64 to compare against.
function Int64:__eq(j) end

---Returns true if first Int64 is less than the second.
---@return boolean
function Int64:__lt() end

---Returns true if the first Int64 is less than or equal to the second.
---@return boolean
function Int64:__le() end

---Returns a Int64 of the bitwise 'not' operation.
---@return Int64 int64 The Int64 object.
function Int64:bnot() end

---Returns a Int64 of the bitwise 'and' operation with the given number/Int64/UInt64.
---@param j Int64
---@return Int64 int64 The Int64 object.
function Int64:band(j) end

---Returns a Int64 of the bitwise 'or' operation, with the given number/Int64/UInt64.
---@param j Int64 The Int64 to or.
---@return Int64 int64 The Int64 object.
function Int64:bor(j) end

---Returns a Int64 of the bitwise 'xor' operation, with the given number/Int64/UInt64.
---@return Int64 int64 The Int64 object.
---@param j Int64 The Int64 to xor.
function Int64:bxor(j) end

---Returns a Int64 of the bitwise logical left-shift operation, by the given number of bits.
---@param numbits number The number of bits to left-shift by.
---@return Int64 int64 The Int64 object.
function Int64:lshift(numbits) end

---Returns a Int64 of the bitwise logical right-shift operation, by the given number of bits.
---@param numbits number The number of bits to right-shift by.
---@return Int64 int64 The Int64 object.
function Int64:rshift(numbits) end

---Returns a Int64 of the bitwise arithmetic right-shift operation, by the given number of bits.
---@param numbits number The number of bits to right-shift by.
---@return Int64 int64 The Int64 object.
function Int64:arshift(numbits) end

---Returns a Int64 of the bitwise left rotation operation, by the given number of bits (up to 63).
---@param numbits number The number of bits to roll left by.
---@return Int64 int64 The Int64 object.
function Int64:rol(numbits) end

---Returns a Int64 of the bitwise right rotation operation, by the given number of bits (up to 63).
---@param numbits number The number of bits to roll right by.
---@return Int64 int64 The Int64 object.
function Int64:ror(numbits) end

---Returns a Int64 of the bytes swapped. This can be used to convert little-endian 64-bit numbers to big-endian 64 bit numbers or vice versa.
---@return Int64 int64 The Int64 object.
function Int64:bswap() end


local function Int64__Test()
    local a = Int64.new(12345678901234)
    local b = Int64.fromhex("00002C7D8C9A3B2A")
    local c = a + b
    local d = Int64()
    print(c:tonumber())
    print(c:tohex())
    print(d:rshift(30))
end
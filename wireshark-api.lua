

-- Using annotations available to VSCode Lua Extension:
-- https://luals.github.io/wiki/annotations/


--#region Global functions

---Gets the Wireshark version as a string.
---@return string 
function get_version()
    return "1.0.0"
end

---@class WiresharkPluginInfo
---@field version string Plugin version
---@field description? string Plugin description
---@field author? string Author's name
---@field repository? string URL to the plugin's repository

---Set a Lua table with meta-data about the plugin, such as version, author name, etc.
---[(details)](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm_modules.html#lua_fn_set_plugin_info_table_) .
---@see WiresharkPluginInfo
---@param table WiresharkPluginInfo
function set_plugin_info(table)
end

---@class NSTime
---@field seconds number
---@field nanoseconds number
---@param seconds? number
---@param nanoseconds? number
function NSTime(seconds, nanoseconds)
    local obj = {}
    setmetatable(obj, { __index = NSTime })
    obj.seconds = seconds
    obj.nanoseconds = nanoseconds
    return obj
end

---Formats an absolute timestamp into a human readable date.
---@return string
---@param timestamp NSTime The timestamp to be formatted.
function format_date(timestamp)
    return "2024-01-01 00:00:00"
end

---Formats a relative timestamp in a human readable time.
---@return string
---@param timestamp NSTime The timestamp to be formatted.
function format_date(timestamp)
    return "2024-01-01 00:00:00"
end

---Get a preference value.
---@return any
---@param preference string The name of the preference.
function get_preference(preference)
    return nil
end

---Set a preference value.
---@param preference string The name of the preference.
---@param value any The value to be set.
function set_preference(preference, value)
end

---Reset a preference to its default value. Returns true on success.
---@return boolean
---@param preference string The name of the preference.
function reset_preference(preference)
    return true
end

---Write preferences to file and apply changes
function apply_preferences()
end

---Reports a failure to the user.
---@param text string message text to report
function report_failure(text)
end

---Loads a Lua file and executes it as a Lua chunk, similar to the standard dofile but searches additional directories.
---The search order is the current directory, followed by the user's personal configuration directory, and finally the global configuration directory.
---@param filename string Name of the file to be run. If the file does not exist in the current directory, the user and system directories are searched.
function dofile(filename)
end

---Loads a Lua file and compiles it into a Lua chunk, similar to the standard loadfile but searches additional directories.
---The search order is the current directory, followed by the user's personal configuration directory, and finally the global configuration directory.
---@param filename string Name of the file to be loaded. If the file does not exist in the current directory, the user and system directories are searched.
---@return function|nil chunk The compiled chunk as a function, or nil on error.
function loadfile(filename)
    return nil
end

---Register a function to handle a -z option.
---@param argument string The name of the option argument.
---@param action? function The function to be called when the command is invoked.
function register_stat_cmd_arg(argument, action)
end

--#endregion


--#region Int64/UInt64
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Int64.html

---@class Int64
---Int64 represents a 64 bit signed integer.
Int64 = {}

---Decodes an 8-byte Lua string, using the given endianness, into a new Int64 object.
---@param string string The Lua string containing a binary 64-bit integer.
---@param endian? boolean If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return Int64|nil int64 The Int64 object created, or nil on failure.
function Int64.decode(string, endian)
    return nil
end

---Creates a Int64 object.
---@param value? number|Int64|UInt64|string A number, UInt64, Int64, or string of ASCII digits to assign the value of the new Int64. Default is 0.
---@param highvalue? number If this is a number and the first argument was a number, then the first will be treated as a lower 32 bits, and this is the high-order 32 bit number.
---@return Int64 int64 The new Int64 object.
function Int64.new(value, highvalue)
    return Int64(0)
end

---Creates an Int64 of the maximum possible positive value (9,223,372,036,854,775,807).
---@return Int64 int64 The new Int64 object of the maximum value.
function Int64.max()
    return Int64(0)
end

---Creates an Int64 of the minimum possible negative value (-9,223,372,036,854,775,808).
---@return Int64 int64 The new Int64 object of the minimum value.
function Int64.min()
    return Int64(0)
end

---Creates an Int64 object from the given hexadecimal string.
---@param hex string The hex-ASCII Lua string.
---@return Int64 int64 The new Int64 object.
function Int64.fromhex(hex)
    return Int64(0)
end

---Encodes the Int64 number into an 8-byte Lua string using the given endianness.
---@param endian? boolean If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return string str The Lua string.
function Int64:encode(endian)
    return ""
end

---Creates a Int64 object.
---@return Int64 int64 The new Int64 object.
function Int64:__call()
    return Int64(0)
end

---Returns a Lua number of the Int64 value. Note that this may lose precision.
---@return number num The Lua number.
function Int64:tonumber()
    return 0
end

---Returns a hexadecimal string of the Int64 value.
---@param numbytes? number The number of hex chars/nibbles to generate. A negative value generates uppercase. Default is 16.
---@return string hex The string hex.
function Int64:tohex(numbytes)
    return ""
end

---Returns a Lua number of the higher 32 bits of the Int64 value. A negative Int64 will return a negative Lua number.
---@return number num The Lua number.
function Int64:higher()
    return 0
end

---Returns a Lua number of the lower 32 bits of the Int64 value. This will always be positive.
---@return number num The Lua number.
function Int64:lower()
    return 0
end

---Converts the Int64 into a string of decimal digits.
---@return string str The Lua string.
function Int64:__tostring()
    return ""
end

---Returns the negative of the Int64 as a new Int64.
---@return Int64 int64 The new Int64.
function Int64:__unm()
    return Int64(0)
end

---Adds two Int64 together and returns a new one. The value may wrapped.
---@return Int64 int64 The new Int64.
function Int64:__add()
    return Int64(0)
end

---Subtracts two Int64 and returns a new one. The value may wrapped.
---@return Int64 int64 The new Int64.
function Int64:__sub()
    return Int64(0)
end

---Multiplies two Int64 and returns a new one. The value may truncated.
---@return Int64 int64 The new Int64.
function Int64:__mul()
    return Int64(0)
end

---Divides two Int64 and returns a new one. Integer divide, no remainder.
---@return Int64 int64 The Int64 object.
function Int64:__div()
    return Int64(0)
end

---Divides two Int64 and returns a new one of the remainder.
---@return Int64 int64 The Int64 object.
function Int64:__mod()
    return Int64(0)
end

---The first Int64 is taken to the power of the second Int64, returning a new one.
---@return Int64 int64 The Int64 object.
function Int64:__pow()
    return Int64(0)
end

---Returns true if both Int64 are equal.
---@return boolean
function Int64:__eq()
    return false
end

---Returns true if first Int64 is less than the second.
---@return boolean
function Int64:__lt()
    return false
end

---Returns true if the first Int64 is less than or equal to the second.
---@return boolean
function Int64:__le()
    return false
end

---Returns a Int64 of the bitwise 'not' operation.
---@return Int64 int64 The Int64 object.
function Int64:bnot()
    return Int64(0)
end

---Returns a Int64 of the bitwise 'and' operation with the given number/Int64/UInt64.
---@return Int64 int64 The Int64 object.
function Int64:band()
    return Int64(0)
end

---Returns a Int64 of the bitwise 'or' operation, with the given number/Int64/UInt64.
---@return Int64 int64 The Int64 object.
function Int64:bor()
    return Int64(0)
end

---Returns a Int64 of the bitwise 'xor' operation, with the given number/Int64/UInt64.
---@return Int64 int64 The Int64 object.
function Int64:bxor()
    return Int64(0)
end

---Returns a Int64 of the bitwise logical left-shift operation, by the given number of bits.
---@param numbits number The number of bits to left-shift by.
---@return Int64 int64 The Int64 object.
function Int64:lshift(numbits)
    return Int64(0)
end

---Returns a Int64 of the bitwise logical right-shift operation, by the given number of bits.
---@param numbits number The number of bits to right-shift by.
---@return Int64 int64 The Int64 object.
function Int64:rshift(numbits)
    return Int64(0)
end

---Returns a Int64 of the bitwise arithmetic right-shift operation, by the given number of bits.
---@param numbits number The number of bits to right-shift by.
---@return Int64 int64 The Int64 object.
function Int64:arshift(numbits)
    return Int64(0)
end

---Returns a Int64 of the bitwise left rotation operation, by the given number of bits (up to 63).
---@param numbits number The number of bits to roll left by.
---@return Int64 int64 The Int64 object.
function Int64:rol(numbits)
    return Int64(0)
end

---Returns a Int64 of the bitwise right rotation operation, by the given number of bits (up to 63).
---@param numbits number The number of bits to roll right by.
---@return Int64 int64 The Int64 object.
function Int64:ror(numbits)
    return Int64(0)
end

---Returns a Int64 of the bytes swapped. This can be used to convert little-endian 64-bit numbers to big-endian 64 bit numbers or vice versa.
---@return Int64 int64 The Int64 object.
function Int64:bswap()
    return Int64(0)
end

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
--#endregion


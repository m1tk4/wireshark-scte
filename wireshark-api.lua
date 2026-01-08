

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

--#region Dir
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Dir.html

---@class Dir
---A Directory object for handling directory operations.
Dir = {}

---Creates a directory.
---The created directory is set for permission mode 0755 (octal).
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true on success, false if the directory already exists, nil on error.
function Dir.make(name)
    return nil
end

---Returns true if the given directory name exists.
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true if the directory exists, false if it's a file, nil on error or not-exist.
function Dir.exists(name)
    return nil
end

---Removes an empty directory.
---This function only removes empty directories. To remove a directory regardless, use Dir.remove_all().
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true on success, false if does not exist, nil on error.
function Dir.remove(name)
    return nil
end

---Removes an empty or non-empty directory.
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true on success, false if does not exist, nil on error.
function Dir.remove_all(name)
    return nil
end

---Opens a directory and returns a Dir object representing the files in the directory.
---@param pathname string The pathname of the directory.
---@param extension? string If given, only files with this extension will be returned.
---@return Dir dir The Dir object.
function Dir.open(pathname, extension)
    return Dir()
end

---Gets the personal configuration directory path, with filename if supplied.
---@param filename? string A filename.
---@return string path The full pathname for a file in the personal configuration directory.
function Dir.personal_config_path(filename)
    return ""
end

---Gets the global configuration directory path, with filename if supplied.
---@param filename? string A filename
---@return string path The full pathname for a file in Wireshark's configuration directory.
function Dir.global_config_path(filename)
    return ""
end

---Gets the personal plugins directory path.
---@return string path The pathname of the personal plugins directory.
function Dir.personal_plugins_path()
    return ""
end

---Gets the global plugins directory path.
---@return string path The pathname of the global plugins directory.
function Dir.global_plugins_path()
    return ""
end

---Gets the next file or subdirectory within the directory, or nil when done.
---@return string|nil filename The next filename or nil when done.
function Dir:__call()
    return nil
end

---Closes the directory. Called automatically during garbage collection of a Dir object.
function Dir:close()
end

--#endregion

--#region Struct
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Struct.html

---@class Struct
---The Struct class offers basic facilities to convert Lua values to and from C-style structs in binary Lua strings.
---All functions are called as static member functions (Struct.pack(...) not object:pack(...)).
Struct = {}

---Returns a string containing the values packed/encoded according to the format string.
---@param format string The format string
---@param ... any One or more Lua value(s) to encode, based on the given format.
---@return string packed The packed binary Lua string, plus any positions due to '=' being used in format.
---@return ... any Additional return values for positions when '=' is used in format.
function Struct.pack(format, ...)
    return ""
end

---Unpacks/decodes multiple Lua values from a given struct-like binary Lua string.
---The number of returned values depends on the format given, plus an additional value of the position where it stopped reading.
---@param format string The format string
---@param struct string The binary Lua string to unpack
---@param begin? number The position to begin reading from (default=1)
---@return ... any One or more values based on format, plus the position it stopped unpacking.
function Struct.unpack(format, struct, begin)
    return nil
end

---Returns the length of a binary string that would be consumed/handled by the given format string.
---@param format string The format string
---@return number size The size number
function Struct.size(format)
    return 0
end

---Returns the number of Lua values contained in the given format string.
---This will be the number of returned values from Struct.unpack() not including the extra return value of offset position.
---@param format string The format string
---@return number count The number of values
function Struct.values(format)
    return 0
end

---Converts the passed-in binary string to a hex-ascii string.
---@param bytestring string A Lua string consisting of binary bytes
---@param lowercase? boolean True to use lower-case hex characters (default=false).
---@param separator? string A string separator to insert between hex bytes (default=nil).
---@return string hex The Lua hex-ascii string
function Struct.tohex(bytestring, lowercase, separator)
    return ""
end

---Converts the passed-in hex-ascii string to a binary string.
---@param hexbytes string A string consisting of hexadecimal bytes like "00 B1 A2" or "1a2b3c4d"
---@param separator? string A string separator between hex bytes/words (default none).
---@return string binary The Lua binary string
function Struct.fromhex(hexbytes, separator)
    return ""
end
--#endregion

--#region Tvb
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Tvb.html

---@class Address

---@class Tvb
---A Tvb represents the packet's buffer. It is passed as an argument to listeners and dissectors.
---Tvbs are usable only by the current listener or dissector call and are destroyed as soon as the listener or dissector returns.
Tvb = {}

---Convert the bytes of a Tvb into a string. This is primarily useful for debugging purposes since the string will be truncated if it is too long.
---@return string str The string.
function Tvb:__tostring()
    return ""
end

---Obtain the reported length (length on the network) of a Tvb.
---@return number length The reported length of the Tvb.
function Tvb:reported_len()
    return 0
end

---Obtain the captured length (amount saved in the capture process) of a Tvb.
---@return number length The captured length of the Tvb.
function Tvb:captured_len()
    return 0
end

---Obtain the captured length (amount saved in the capture process) of a Tvb. Same as captured_len; kept only for backwards compatibility.
---@return number length The captured length of the Tvb.
function Tvb:len()
    return 0
end

---Obtain the reported (not captured) length of packet data to end of a Tvb or 0 if the offset is beyond the end of the Tvb.
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@return number length The remaining reported length of the Tvb.
function Tvb:reported_length_remaining(offset)
    return 0
end

---Obtain a ByteArray from a Tvb.
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to until the end of the Tvb.
---@return ByteArray|nil bytearray The ByteArray object or nil.
function Tvb:bytes(offset, length)
    return nil
end

---Returns the raw offset (from the beginning of the source Tvb) of a sub Tvb.
---@return number offset The raw offset of the Tvb.
function Tvb:offset()
    return 0
end

---Equivalent to tvb:range(...)
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to -1, which specifies the remaining bytes in the Tvb.
---@return TvbRange range The TvbRange.
function Tvb:__call(offset, length)
    return TvbRange()
end

---Creates a TvbRange from this Tvb.
---@param offset? number The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to -1, which specifies the remaining bytes in the Tvb.
---@return TvbRange range The TvbRange.
function Tvb:range(offset, length)
    return TvbRange()
end

---Obtain a Lua string of the binary bytes in a Tvb.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the segment to get. Default is -1, or the remaining bytes in the Tvb.
---@return string str A Lua string of the binary bytes in the Tvb.
function Tvb:raw(offset, length)
    return ""
end

---Checks whether contents of two Tvbs are equal.
---@return boolean
function Tvb:__eq()
    return false
end

--#endregion

--#region TvbRange
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Tvb.html

---@class TvbRange
---A TvbRange represents a usable range of a Tvb and is used to extract data from the Tvb that generated it.
---TvbRanges are created by calling a Tvb (e.g. 'tvb(offset,length)'). If the TvbRange span is outside the Tvb's range the creation will cause a runtime error.
TvbRange = {}

---Creates a new Tvb from a TvbRange.
---@return Tvb tvb The new Tvb.
function TvbRange:tvb()
    return Tvb()
end

---Get a Big Endian (network order) unsigned integer from a TvbRange. The range must be 1-4 octets long.
---@return number value The unsigned integer value.
function TvbRange:uint()
    return 0
end

---Get a Little Endian unsigned integer from a TvbRange. The range must be 1-4 octets long.
---@return number value The unsigned integer value.
function TvbRange:le_uint()
    return 0
end

---Get a Big Endian (network order) unsigned 64 bit integer from a TvbRange, as a UInt64 object. The range must be 1-8 octets long.
---@return UInt64 value The UInt64 object.
function TvbRange:uint64()
    return UInt64(0)
end

---Get a Little Endian unsigned 64 bit integer from a TvbRange, as a UInt64 object. The range must be 1-8 octets long.
---@return UInt64 value The UInt64 object.
function TvbRange:le_uint64()
    return UInt64(0)
end

---Get a Big Endian (network order) signed integer from a TvbRange. The range must be 1-4 octets long.
---@return number value The signed integer value.
function TvbRange:int()
    return 0
end

---Get a Little Endian signed integer from a TvbRange. The range must be 1-4 octets long.
---@return number value The signed integer value.
function TvbRange:le_int()
    return 0
end

---Get a Big Endian (network order) signed 64 bit integer from a TvbRange, as an Int64 object. The range must be 1-8 octets long.
---@return Int64 value The Int64 object.
function TvbRange:int64()
    return Int64(0)
end

---Get a Little Endian signed 64 bit integer from a TvbRange, as an Int64 object. The range must be 1-8 octets long.
---@return Int64 value The Int64 object.
function TvbRange:le_int64()
    return Int64(0)
end

---Get a Big Endian (network order) floating point number from a TvbRange. The range must be 4 or 8 octets long.
---@return number value The floating point value.
function TvbRange:float()
    return 0.0
end

---Get a Little Endian floating point number from a TvbRange. The range must be 4 or 8 octets long.
---@return number value The floating point value.
function TvbRange:le_float()
    return 0.0
end

---Get an IPv4 Address from a TvbRange, as an Address object.
---@return Address address The IPv4 Address object.
function TvbRange:ipv4()
    return Address()
end

---Get an Little Endian IPv4 Address from a TvbRange, as an Address object.
---@return Address address The IPv4 Address object.
function TvbRange:le_ipv4()
    return Address()
end

---Get an IPv6 Address from a TvbRange, as an Address object.
---@return Address address The IPv6 Address object.
function TvbRange:ipv6()
    return Address()
end

---Get an Ethernet Address from a TvbRange, as an Address object.
---@return Address address The Ethernet Address object.
function TvbRange:ether()
    return Address()
end

---Obtain a time_t structure from a TvbRange, as an NSTime object.
---@param encoding? number An optional ENC_* encoding value to use.
---@return NSTime|nil nstime The NSTime object, or nil on failure.
---@return number|nil bytes Number of bytes used, or nil on failure.
function TvbRange:nstime(encoding)
    return nil, nil
end

---Obtain a nstime from a TvbRange, as an NSTime object.
---@return NSTime nstime The NSTime object.
function TvbRange:le_nstime()
    return NSTime()
end

---Obtain a string from a TvbRange.
---@param encoding? number The encoding to use. Defaults to ENC_ASCII.
---@return string str A string containing all bytes in the TvbRange including all zeroes.
function TvbRange:string(encoding)
    return ""
end

---Obtain a Big Endian (network order) UTF-16 encoded string from a TvbRange.
---@return string str A string containing all bytes in the TvbRange including all zeroes.
function TvbRange:ustring()
    return ""
end

---Obtain a Little Endian UTF-16 encoded string from a TvbRange.
---@return string str A string containing all bytes in the TvbRange including all zeroes.
function TvbRange:le_ustring()
    return ""
end

---Obtain a zero terminated string from a TvbRange.
---@param encoding? number The encoding to use. Defaults to ENC_ASCII.
---@return string str The string containing all bytes in the TvbRange up to the first terminating zero.
function TvbRange:stringz(encoding)
    return ""
end

---Find the size of a zero terminated string from a TvbRange. The size of the string includes the terminating zero.
---@param encoding? number The encoding to use. Defaults to ENC_ASCII.
---@return number length Length of the zero terminated string.
function TvbRange:strsize(encoding)
    return 0
end

---Obtain a Big Endian (network order) UTF-16 encoded zero terminated string from a TvbRange.
---@return string str The zero terminated string.
---@return number length The length.
function TvbRange:ustringz()
    return "", 0
end

---Obtain a Little Endian UTF-16 encoded zero terminated string from a TvbRange.
---@return string str The zero terminated string.
---@return number length The length.
function TvbRange:le_ustringz()
    return "", 0
end

---Obtain a ByteArray from a TvbRange.
---@param encoding? number An optional ENC_* encoding value to use.
---@return ByteArray|nil bytearray The ByteArray object or nil.
---@return number|nil bytes Number of bytes consumed or nil.
function TvbRange:bytes(encoding)
    return nil, nil
end

---Get a bitfield from a TvbRange.
---@param position? number The bit offset (MSB 0 bit numbering) from the beginning of the TvbRange. Defaults to 0.
---@param length? number The length in bits of the field. Defaults to 1.
---@return number value The bitfield value.
function TvbRange:bitfield(position, length)
    return 0
end

---Creates a sub-TvbRange from this TvbRange.
---@param offset? number The offset (in octets) from the beginning of the TvbRange. Defaults to 0.
---@param length? number The length (in octets) of the range. Defaults to until the end of the TvbRange.
---@return TvbRange range The TvbRange.
function TvbRange:range(offset, length)
    return TvbRange()
end

---Given a TvbRange containing zlib compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_zlib(name)
    return TvbRange()
end

---Given a TvbRange containing zlib compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data. Deprecated; use uncompress_zlib() instead.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress(name)
    return TvbRange()
end

---Given a TvbRange containing Brotli compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_brotli(name)
    return TvbRange()
end

---Given a TvbRange containing data compressed using the Huffman encoding in HTTP/2 HPACK and HTTP/3 QPACK, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_hpack_huff(name)
    return TvbRange()
end

---Given a TvbRange containing Microsoft Plain LZ77 compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_lz77(name)
    return TvbRange()
end

---Given a TvbRange containing Microsoft LZ77+Huffman compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_lz77huff(name)
    return TvbRange()
end

---Given a TvbRange containing Microsoft LZNT1 compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_lznt1(name)
    return TvbRange()
end

---Given a TvbRange containing Snappy compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_snappy(name)
    return TvbRange()
end

---Given a TvbRange containing Zstandard compressed data, decompresses the data and returns a new TvbRange containing the uncompressed data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:uncompress_zstd(name)
    return TvbRange()
end

---Given a TvbRange containing Base64 encoded data, return a new TvbRange containing the decoded data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:decode_base64(name)
    return TvbRange()
end

---Given a TvbRange containing base64url encoded data, return a new TvbRange containing the decoded data.
---@param name string The name to be given to the new data source.
---@return TvbRange range The TvbRange.
function TvbRange:decode_base64url(name)
    return TvbRange()
end

---Obtain the length of a TvbRange.
---@return number length The length of the TvbRange.
function TvbRange:len()
    return 0
end

---Obtain the offset in a TvbRange.
---@return number offset The offset in the TvbRange.
function TvbRange:offset()
    return 0
end

---Obtain a Lua string of the binary bytes in a TvbRange.
---@param offset? number The position of the first byte within the range. Default is 0, or first byte.
---@param length? number The length of the segment to get. Default is -1, or the remaining bytes in the range.
---@return string str A Lua string of the binary bytes in the TvbRange.
function TvbRange:raw(offset, length)
    return ""
end

---Checks whether the contents of two TvbRanges are equal.
---@return boolean
function TvbRange:__eq()
    return false
end

---Converts the TvbRange into a string. The string can be truncated.
---@return string str A Lua hex string of the TvbRange truncated to 24 bytes.
function TvbRange:__tostring()
    return ""
end

--#endregion

--#region ByteArray
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Tvb.html#lua_class_ByteArray

---@class ByteArray
---A ByteArray is a sequence of bytes used for handling binary data.
ByteArray = {}

---Creates a new ByteArray object.
---If the second argument is boolean true, the first argument is treated as raw binary data instead of hex string.
---@param hexbytes? string A string consisting of hexadecimal bytes like "00 B1 A2" or "1a2b3c4d".
---@param separator? string|boolean A string separator between hex bytes/words (default=" "), or if boolean true then first arg is treated as raw binary data.
---@return ByteArray bytearray The new ByteArray object.
function ByteArray.new(hexbytes, separator)
    return ByteArray()
end

---Concatenate two ByteArrays.
---@param first ByteArray First array.
---@param second ByteArray Second array.
---@return ByteArray bytearray The new composite ByteArray.
function ByteArray:__concat(first, second)
    return ByteArray()
end

---Compares two ByteArray values.
---@param first ByteArray First array.
---@param second ByteArray Second array.
---@return boolean
function ByteArray:__eq(first, second)
    return false
end

---Prepend a ByteArray to this ByteArray.
---@param prepended ByteArray ByteArray to be prepended.
function ByteArray:prepend(prepended)
end

---Append a ByteArray to this ByteArray.
---@param appended ByteArray ByteArray to be appended.
function ByteArray:append(appended)
end

---Sets the size of a ByteArray, either truncating it or filling it with zeros.
---@param size number New size of the array.
function ByteArray:set_size(size)
end

---Sets the value of an index of a ByteArray.
---@param index number The position of the byte to be set.
---@param value number The char value to set [0-255].
function ByteArray:set_index(index, value)
end

---Get the value of a byte in a ByteArray.
---@param index number The position of the byte to get.
---@return number value The value [0-255] of the byte.
function ByteArray:get_index(index)
    return 0
end

---Read a little endian encoded signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the little endian encoded signed integer.
function ByteArray:le_int(offset, length)
    return 0
end

---Read a little endian encoded 64 bit signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return Int64 value The value as an Int64 object.
function ByteArray:le_int64(offset, length)
    return Int64(0)
end

---Read a little endian encoded unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the little endian encoded unsigned integer.
function ByteArray:le_uint(offset, length)
    return 0
end

---Read a little endian encoded 64 bit unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return UInt64 value The value as a UInt64 object.
function ByteArray:le_uint64(offset, length)
    return UInt64(0)
end

---Read a big endian encoded signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the big endian encoded 32 bit signed integer.
function ByteArray:int(offset, length)
    return 0
end

---Read a big endian encoded 64 bit signed integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return Int64 value The value as an Int64 object.
function ByteArray:int64(offset, length)
    return Int64(0)
end

---Read a big endian encoded unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return number value The value of the big endian encoded 32 bit unsigned integer.
function ByteArray:uint(offset, length)
    return 0
end

---Read a big endian encoded 64 bit unsigned integer in a ByteArray beginning at given offset with given length.
---@param offset? number The position of the first byte. Default is 0, or the first byte.
---@param length? number The length of the integer. Default is -1, or the remaining bytes in the ByteArray.
---@return UInt64 value The value as a UInt64 object.
function ByteArray:uint64(offset, length)
    return UInt64(0)
end

---Obtain the length of a ByteArray.
---@return number length The length of the ByteArray.
function ByteArray:len()
    return 0
end

---Obtain a segment of a ByteArray, as a new ByteArray.
---@param offset number The position of the first byte (0=first).
---@param length number The length of the segment.
---@return ByteArray bytearray A ByteArray containing the requested segment.
function ByteArray:subset(offset, length)
    return ByteArray()
end

---Obtain a Base64 decoded ByteArray.
---@return ByteArray bytearray The created ByteArray.
function ByteArray:base64_decode()
    return ByteArray
end

---Obtain a Lua string of the binary bytes in a ByteArray.
---@param offset? number The position of the first byte (default=0/first).
---@param length? number The length of the segment to get (default=all).
---@return string bytes A Lua string of the binary bytes in the ByteArray.
function ByteArray:raw(offset, length)
    return ""
end

---Obtain a Lua string of the bytes in a ByteArray as hex-ascii, with given separator.
---@param lowercase? boolean True to use lower-case hex characters (default=false).
---@param separator? string A string separator to insert between hex bytes (default=nil).
---@return string hex A hex-ascii string representation of the ByteArray.
function ByteArray:tohex(lowercase, separator)
    return ""
end

---Obtain a Lua string containing the bytes in a ByteArray so that it can be used in display filters.
---@return string hex A hex-ascii string representation of the ByteArray.
function ByteArray:__tostring()
    return ""
end

---Creates a new Tvb from a ByteArray. The Tvb will be added to the current frame.
---@param name string The name to be given to the new data source.
---@return Tvb tvb The created Tvb.
function ByteArray:tvb(name)
    return Tvb()
end
--#endregion

--#region Pinfo Module
-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

---@class convtypes
---Conversation types for use with Conversation.find() and Conversation.find_by_id()
convtypes = {
    NONE = 0,
    SCTP = 1,
    TCP = 2,
    UDP = 3,
    DCCP = 4,
    IPX = 5,
    NCP = 6,
    EXCHG = 7,
    DDP = 8,
    SBCCS = 9,
    IDP = 10,
    TIPC = 11,
    USB = 12,
    I2C = 13,
    IBQP = 14,
    BLUETOOTH = 15,
    TDMOP = 16,
    DVBCI = 17,
    ISO14443 = 18,
    ISDN = 19,
    H223 = 20,
    X25 = 21,
    IAX2 = 22,
    DLCI = 23,
    ISUP = 24,
    BICC = 25,
    GSMTAP = 26,
    IUUP = 27,
    DVBBBF = 28,
    IWARP_MPA = 29,
    BT_UTP = 30,
    LOG = 31,
    LTP = 32,
    MCTP = 33,
    NVME_MI = 34,
    BP = 35,
    SNMP = 36,
    QUIC = 37,
    IDN = 38,
    IP = 39,
    IPV6 = 40,
    ETH = 41,
    ETH_NN = 42,
    ETH_NV = 43,
    ETH_IN = 44,
    ETH_IV = 45,
    VSPC_VMOTION = 46,
    OPENVPN = 47,
    PROXY = 48,
    DNP3 = 49,
}

---@class Address
---Represents an address.
Address = {}

---Creates an Address Object representing an IPv4 address.
---@param hostname string The address or name of the IP host.
---@return Address address The Address object.
function Address.ip(hostname)
    return Address()
end

---Creates an Address Object representing an IPv6 address.
---@param hostname string The address or name of the IP host.
---@return Address address The Address object.
function Address.ipv6(hostname)
    return Address()
end

---Creates an Address Object representing an Ethernet address.
---@param eth string The Ethernet address.
---@return Address address The Address object.
function Address.ether(eth)
    return Address()
end

---Returns the string representing the address.
---@return string str The string representing the address.
function Address:__tostring()
    return ""
end

---Compares two Addresses.
---@return boolean
function Address:__eq()
    return false
end

---Compares two Addresses.
---@return boolean
function Address:__le()
    return false
end

---Compares two Addresses.
---@return boolean
function Address:__lt()
    return false
end

---@class Column
---A Column in the packet list.
Column = {}

---Returns the column's string text (in parenthesis if not available).
---@return string text The column's string text.
function Column:__tostring()
    return ""
end

---Clears a Column.
function Column:clear()
end

---Sets the text of a Column.
---@param text string The text to which to set the Column.
function Column:set(text)
end

---Appends text to a Column.
---@param text string The text to append to the Column.
---@param sep? string An optional separator to use as prefix if the column is not empty.
function Column:append(text, sep)
end

---Prepends text to a Column.
---@param text string The text to prepend to the Column.
function Column:prepend(text)
end

---Sets Column text fence, to prevent overwriting.
function Column:fence()
end

---Clear Column text fence.
function Column:clear_fence()
end

---@class Columns
---The Columns of the packet list.
Columns = {}

---Returns the string "Columns". This has no real use aside from debugging.
---@return string
function Columns:__tostring()
    return "Columns"
end

---Sets the text of a specific column. Some columns cannot be modified, and no error is raised if attempted.
---The columns that are known to allow modification are "info" and "protocol".
---@param column string The name of the column to set (e.g. "info", "protocol", "src", "dst", etc.).
---@param text string The text for the column.
function Columns:__newindex(column, text)
end

---Get a specific Column.
---@param column string The name of the column.
---@return Column column The Column object.
function Columns:__index(column)
    return Column()
end

---@class Conversation
---Conversation object, used to attach conversation data or a conversation dissector.
Conversation = {}

---Searches for a Conversation instance matching criteria. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param framenum number The number of a frame within the conversation.
---@param ctype convtypes Conversation Type (e.g., convtypes.TCP, convtypes.UDP, etc.).
---@param addr1 Address First Address of the conversation.
---@param addr2? Address Second Address of the conversation. (defaults to nil)
---@param port1? number First port. A value of nil or 0 is treated as 'ignore' (default)
---@param port2? number Second port. A value of nil or 0 is treated as 'ignore' (default)
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find(framenum, ctype, addr1, addr2, port1, port2, create)
    return nil
end

---Searches for a Conversation object by id. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param framenum number The number of a frame within the conversation.
---@param ctype convtypes Conversation Type (e.g., convtypes.TCP, convtypes.UDP, etc.).
---@param id number Conversation or session specific ID.
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find_by_id(framenum, ctype, id, create)
    return nil
end

---Searches for a Conversation object matching a pinfo. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param pinfo Pinfo A Pinfo object.
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find_from_pinfo(pinfo, create)
    return nil
end

---Compares two Conversation objects.
---@return boolean result True if both objects refer to the same underlying conversation structure. False otherwise.
function Conversation:__eq()
    return false
end

---Returns a string representation of the Conversation object.
---@return string str A string representation of the object.
function Conversation:__tostring()
    return ""
end

---Sets protocol data for a specific protocol.
---@param index any The protocol index to set. Must be a Proto.
---@param value any The protocol data to set (any valid lua object).
function Conversation:__newindex(index, value)
end

---Get protocol data for a specific protocol.
---@param index any The protocol index to get. Must be a Proto.
---@return any|nil data Previously assigned conversation data, or nil.
function Conversation:__index(index)
    return nil
end

---@class NSTime
---NSTime represents a nstime_t. This is an object with seconds and nanoseconds.
---@field secs number The NSTime seconds.
---@field nsecs number The NSTime nano seconds.
NSTime = {}

---Creates a new NSTime object.
---@param seconds? number Seconds.
---@param nseconds? number Nano seconds.
---@return NSTime nstime The new NSTime object.
function NSTime.new(seconds, nseconds)
    return NSTime()
end

---Creates a NSTime object.
---@param seconds? number Seconds.
---@param nseconds? number Nanoseconds.
---@return NSTime nstime The new NSTime object.
function NSTime:__call(seconds, nseconds)
    return NSTime()
end

---Returns a Lua number of the NSTime representing seconds from epoch.
---@return number num The Lua number.
function NSTime:tonumber()
    return 0
end

---Returns the string representing the nstime.
---@return string str The string representing the nstime.
function NSTime:__tostring()
    return ""
end

---Calculates the sum of two NSTimes.
---@return NSTime nstime The sum of two NSTimes.
function NSTime:__add()
    return NSTime()
end

---Calculates the diff of two NSTimes.
---@return NSTime nstime The difference of two NSTimes.
function NSTime:__sub()
    return NSTime()
end

---Calculates the negative NSTime.
---@return NSTime nstime The negative NSTime.
function NSTime:__unm()
    return NSTime()
end

---Compares two NSTimes.
---@return boolean
function NSTime:__eq()
    return false
end

---Compares two NSTimes.
---@return boolean
function NSTime:__le()
    return false
end

---Compares two NSTimes.
---@return boolean
function NSTime:__lt()
    return false
end

---@class Proto
---@class Dissector

---@class Pinfo
---Packet information.
---@field visited boolean Whether this packet has been already visited (read-only).
---@field number number The number of this packet in the current file (read-only).
---@field len number The length of the frame (read-only).
---@field caplen number The captured length of the frame (read-only).
---@field abs_ts NSTime When the packet was captured (read-only).
---@field rel_ts NSTime Number of seconds passed since beginning of capture (read-only).
---@field delta_ts NSTime Number of seconds passed since the last captured packet (read-only).
---@field delta_dis_ts NSTime Number of seconds passed since the last displayed packet (read-only).
---@field curr_proto string Which Protocol are we dissecting (read-only).
---@field can_desegment number Set if this segment could be desegmented.
---@field saved_can_desegment number Value of can_desegment before the current dissector was called (read-only).
---@field desegment_len number Estimated number of additional bytes required for completing the PDU.
---@field desegment_offset number Offset in the tvbuff at which the dissector will continue processing when next called.
---@field fragmented boolean If the protocol is only a fragment (read-only).
---@field in_error_pkt boolean If we're inside an error packet.
---@field match_uint number Matched uint for calling subdissector from table (read-only).
---@field match_string string Matched string for calling subdissector from table (read-only).
---@field port_type number Type of Port of .src_port and .dst_port.
---@field src_port number Source Port of this Packet.
---@field dst_port number Destination Port of this Packet.
---@field dl_src Address Data Link Source Address of this Packet.
---@field dl_dst Address Data Link Destination Address of this Packet.
---@field net_src Address Network Layer Source Address of this Packet.
---@field net_dst Address Network Layer Destination Address of this Packet.
---@field src Address Source Address of this Packet.
---@field dst Address Destination Address of this Packet.
---@field p2p_dir number Direction of this Packet (incoming / outgoing).
---@field match any Port/Data we are matching (read-only).
---@field columns Columns Access to the packet list columns (read-only).
---@field cols Columns Access to the packet list columns, equivalent to pinfo.columns (read-only).
---@field private private PrivateTable Access to the private table entries (read-only).
---@field hi Address Higher Address of this Packet.
---@field lo Address Lower Address of this Packet (read-only).
---@field conversation Conversation|Dissector|Proto On read, returns a Conversation object. On write, sets the Dissector for the current conversation.
Pinfo = {}

---@class PrivateTable
---PrivateTable represents the pinfo->private_table.
PrivateTable = {}

---Gets debugging type information about the private table.
---@return string info A string with all keys in the table, mostly for debugging.
function PrivateTable:__tostring()
    return ""
end

--#endregion



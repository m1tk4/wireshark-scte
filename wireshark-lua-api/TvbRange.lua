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

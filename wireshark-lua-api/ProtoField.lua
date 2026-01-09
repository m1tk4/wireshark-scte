---@meta

---A Protocol field (to be used when adding items to the dissection tree).
---
---It must be registered via being added to a `Proto.fields` table.
---@class ProtoField
ProtoField = {}

---Creates a new ProtoField object to be used for a protocol field.
---@param name string Actual name of the field (the string that appears in the tree)
---@param abbr string Filter name of the field (the string that is used in filters)
---@param type ftypes Field Type: one of ftypes constants
---@param valuestring? table|number A table containing the text that corresponds to the values, or frametype constant if field type is ftypes.FRAMENUM
---@param base? number The representation: base.NONE, base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC, etc.
---@param mask? number|string|UInt64 The bitmask to be used
---@param description? string The description of the field
---@return ProtoField # The newly created ProtoField object
function ProtoField.new(name, abbr, type, valuestring, base, mask, description) end

---Creates a ProtoField of an 8-bit ASCII character.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.NONE, base.HEX or base.OCT (can be ORed with base.RANGE_STRING and base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number Integer mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.char(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of an unsigned 8-bit integer (i.e., a byte).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC (can be ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.uint8(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of an unsigned 16-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC (can be ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.uint16(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of an unsigned 24-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC (can be ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.uint24(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of an unsigned 32-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC (can be ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.uint32(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of an unsigned 64-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC (can be ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.uint64(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of a signed 8-bit integer (i.e., a byte).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number Must be base.DEC (optionally ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.int8(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of a signed 16-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number Must be base.DEC (optionally ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.int16(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of a signed 24-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number Must be base.DEC (optionally ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.int24(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of a signed 32-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number Must be base.DEC (optionally ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.int32(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField of a signed 64-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number Must be base.DEC (optionally ORed with base.UNIT_STRING, base.RANGE_STRING, base.SPECIAL_VALS)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.int64(abbr, name, base, valuestring, mask, description) end

---Creates a ProtoField for a frame number (for hyperlinks between frames).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number Only base.NONE is supported for framenum
---@param frametype? number One of frametype.NONE, frametype.REQUEST, frametype.RESPONSE, frametype.ACK, frametype.DUP_ACK
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field (must be 0 for framenum)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.framenum(abbr, name, base, frametype, mask, description) end

---Creates a ProtoField for a boolean true/false value.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param display? number How wide the parent bitfield is (base.NONE is used for NULL-value)
---@param valuestring? table A table containing the text that corresponds to the values
---@param mask? number|string|UInt64 Integer, String or UInt64 mask of this field
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.bool(abbr, name, display, valuestring, mask, description) end

---Creates a ProtoField of a time_t structure value.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param base? number One of base.LOCAL, base.UTC, base.DOY_UTC
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.absolute_time(abbr, name, base, description) end

---Creates a ProtoField of a time_t structure value.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.relative_time(abbr, name, description) end

---Creates a ProtoField of a floating point number (4 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param valuestring? table A table containing unit name for the values
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.float(abbr, name, valuestring, description) end

---Creates a ProtoField of a double-precision floating point (8 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param valuestring? table A table containing unit name for the values
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.double(abbr, name, valuestring, description) end

---Creates a ProtoField of a string value.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param display? number One of base.ASCII or base.UNICODE
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.string(abbr, name, display, description) end

---Creates a ProtoField of a zero-terminated string value.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param display? number One of base.ASCII or base.UNICODE
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.stringz(abbr, name, display, description) end

---Creates a ProtoField for an arbitrary number of bytes.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param display? number One of base.NONE, base.DOT, base.DASH, base.COLON, base.SPACE
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.bytes(abbr, name, display, description) end

---Creates a ProtoField for an arbitrary number of unsigned bytes.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param display? number One of base.NONE, base.DOT, base.DASH, base.COLON, base.SPACE
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.ubytes(abbr, name, display, description) end

---Creates a ProtoField of an unstructured type.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.none(abbr, name, description) end

---Creates a ProtoField of an IPv4 address (4 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.ipv4(abbr, name, description) end

---Creates a ProtoField of an IPv6 address (16 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.ipv6(abbr, name, description) end

---Creates a ProtoField of an Ethernet address (6 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.ether(abbr, name, description) end

---Creates a ProtoField for a Globally Unique IDentifier (GUID).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.guid(abbr, name, description) end

---Creates a ProtoField for an ASN.1 Organizational IDentified (OID).
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.oid(abbr, name, description) end

---Creates a ProtoField for a sub-protocol.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.protocol(abbr, name, description) end

---Creates a ProtoField for an ASN.1 Relative-OID.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.rel_oid(abbr, name, description) end

---Creates a ProtoField for an OSI System ID.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.systemid(abbr, name, description) end

---Creates a ProtoField for an EUI64.
---@param abbr string Abbreviated name of the field (the string used in filters)
---@param name? string Actual name of the field (the string that appears in the tree)
---@param description? string Description of the field
---@return ProtoField # A ProtoField object to be added to Proto.fields
function ProtoField.eui64(abbr, name, description) end

---Returns a string with info about a protofield (for debugging purposes).
---@return string
function ProtoField:__tostring() end

---The type of the field.
---
---Since: 4.3.0
---@type number
ProtoField.type = 0

---The abbreviated name of the field.
---
---Since: 4.3.0
---@type string
ProtoField.abbr = ""

---The actual name of the field.
---
---Since: 4.3.0
---@type string
ProtoField.name = ""

---The base of the field.
---
---Since: 4.3.0
---@type number
ProtoField.base = 0

---The valuestring of the field.
---
---Since: 4.3.0
---@type table|nil
ProtoField.valuestring = nil

---The mask of the field.
---
---Since: 4.3.0
---@type number
ProtoField.mask = 0

---The description of this field.
---
---Since: 4.3.0
---@type string
ProtoField.description = ""


---Base constants for ProtoField display types.
---
---These constants are used to specify how field values should be displayed in Wireshark.
---Many can be combined with bitwise OR.
base = {
    ---No special formatting
    NONE = 0,
    ---Decimal
    DEC = 1,
    ---Hexadecimal
    HEX = 2,
    ---Octal
    OCT = 3,
    ---Decimal with hexadecimal in parentheses
    DEC_HEX = 4,
    ---Hexadecimal with decimal in parentheses
    HEX_DEC = 5,
    ---Custom formatting
    CUSTOM = 6,
    ---Exponential notation
    EXP = 7,
    ---Dotted format (for bytes)
    DOT = 8,
    ---Dash-separated format (for bytes)
    DASH = 9,
    ---Colon-separated format (for bytes)
    COLON = 10,
    ---Space-separated format (for bytes)
    SPACE = 11,
    ---Netmask format
    NETMASK = 12,
    ---Port type: UDP
    PT_UDP = 13,
    ---Port type: TCP
    PT_TCP = 14,
    ---Port type: DCCP
    PT_DCCP = 15,
    ---Port type: SCTP
    PT_SCTP = 16,
    ---OUI (Organizationally Unique Identifier) format
    OUI = 17,
    ---Local time
    LOCAL = 18,
    ---UTC time
    UTC = 19,
    ---Day of year UTC
    DOY_UTC = 20,
    ---NTP UTC time
    NTP_UTC = 21,
    ---Unix timestamp
    UNIX = 22,
    ---String with whitespace
    STR_WSP = 23,
    ---Range string (ORable flag)
    RANGE_STRING = 256,
    ---Extended string (ORable flag)
    EXT_STRING = 512,
    ---VAL64 string (ORable flag)
    VAL64_STRING = 1024,
    ---Allow zero value (ORable flag)
    ALLOW_ZERO = 2048,
    ---Unit string (ORable flag)
    UNIT_STRING = 4096,
    ---No display value (ORable flag)
    NO_DISPLAY_VALUE = 8192,
    ---Protocol info (ORable flag)
    PROTOCOL_INFO = 16384,
    ---Special values (ORable flag)
    SPECIAL_VALS = 32768,
    ---Show ASCII printable characters (ORable flag)
    SHOW_ASCII_PRINTABLE = 65536,
    ---Show UTF-8 printable characters (ORable flag)
    SHOW_UTF_8_PRINTABLE = 131072,
}

---Frame type constants for ProtoField.framenum().
---
---These constants are used to specify the type of frame relationship.
frametype = {
    ---No frame type
    NONE = 0,
    ---Request frame
    REQUEST = 1,
    ---Response frame
    RESPONSE = 2,
    ---Acknowledgment frame
    ACK = 3,
    ---Duplicate acknowledgment frame
    DUP_ACK = 4,
    ---Previous retransmission frame
    RETRANS_PREV = 5,
    ---Next retransmission frame
    RETRANS_NEXT = 6,
    ---Number of frame types
    NUM_TYPES = 7,
}

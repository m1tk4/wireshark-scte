---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Field.html#lua_class_Field
-- https://github.com/wireshark/wireshark/blob/4988cfd31b29704411a7bd341a3034a989996943/test/lua/globals_5.0.txt#L1626

---@enum ftypes
---Field type enumeration values from Wireshark Lua ftypes global table
ftypes = {
    ABSOLUTE_TIME = 24,
    AX25 = 39,
    BOOLEAN = 2,
    BYTES = 30,
    CHAR = 3,
    DOUBLE = 23,
    ETHER = 29,
    EUI64 = 38,
    FCWWN = 44,
    FLOAT = 22,
    FRAMENUM = 35,
    GUID = 36,
    IEEE_11073_FLOAT = 21,
    IEEE_11073_SFLOAT = 20,
    INT16 = 13,
    INT24 = 14,
    INT32 = 15,
    INT40 = 16,
    INT48 = 17,
    INT56 = 18,
    INT64 = 19,
    INT8 = 12,
    IPv4 = 32,
    IPv6 = 33,
    IPXNET = 34,
    NONE = 0,
    OID = 37,
    PROTOCOL = 1,
    REL_OID = 41,
    RELATIVE_TIME = 25,
    STRING = 26,
    STRINGZ = 27,
    STRINGZPAD = 43,
    STRINGZTRUNC = 45,
    SYSTEM_ID = 42,
    UINT_BYTES = 31,
    UINT_STRING = 28,
    UINT16 = 5,
    UINT24 = 6,
    UINT32 = 7,
    UINT40 = 8,
    UINT48 = 9,
    UINT56 = 10,
    UINT64 = 11,
    UINT8 = 4,
    VINES = 40,
}

---@class Field
---A Field extractor to obtain field values. A Field object can only be created outside of the callback
---functions of dissectors, post-dissectors, heuristic-dissectors, and taps. Once created, it is used
---inside the callback functions, to generate a FieldInfo object.
---@field name string|nil The filter name of this field, or nil (read-only).
---@field display string|nil The full display name of this field, or nil (read-only).
---@field type ftypes|nil The ftype of this field, or nil (read-only).
Field = {}

---Create a Field extractor.
---@param fieldname string The filter name of the field (e.g. ip.addr).
---@return Field field The field extractor.
function Field.new(fieldname) end

---Gets a Lua array table of all registered field filter names.
---Note: This is an expensive operation, and should only be used for troubleshooting.
---@return string[] fields The array table of field filter names.
function Field.list() end

---Obtain all values (see FieldInfo) for this field.
---@return FieldInfo[] fieldinfos All the values of this field.
function Field:__call() end

---Obtain all values (see FieldInfo) for this field.
---@return FieldInfo[] fieldinfos All the values of this field.
function Field() end

---Obtain a string with the field filter name.
---@return string name The field filter name.
function Field:__tostring() end

local function Field__test()
    local f = Field.new("ip.addr")
    local name = f.name
    local display = f.display
    local ftype = f.type
end
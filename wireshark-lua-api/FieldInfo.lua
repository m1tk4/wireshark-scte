-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Field.html#lua_class_FieldInfo

---@class FieldInfo
---An extracted Field from dissected packet data. A FieldInfo object can only be used within the callback
---functions of dissectors, post-dissectors, heuristic-dissectors, and taps. A FieldInfo can be called on
---either existing Wireshark fields by using Field.new() or Field() before-hand, or it can be called on
---new fields created by Lua from a ProtoField.
---@field len number The length of this field (read-only).
---@field offset number The offset of this field (read-only).
---@field value any The value of this field (read-only).
---@field label string The string representing this field (read-only).
---@field display string The string display of this field as seen in GUI (read-only).
---@field type ftypes The internal field type, a number which matches one of the ftypes values (read-only).
---@field source Tvb|nil The source Tvb object the FieldInfo is derived from, or nil if there is none (read-only).
---@field range TvbRange|nil The TvbRange covering the bytes of this field in a Tvb or nil if there is none (read-only).
---@field generated boolean Whether this field was marked as generated (read-only).
---@field hidden boolean Whether this field was marked as hidden (read-only).
---@field is_url boolean Whether this field was marked as being a URL (read-only).
---@field little_endian boolean Whether this field is little-endian encoded (read-only).
---@field big_endian boolean Whether this field is big-endian encoded (read-only).
---@field name string The filter name of this field (read-only).
FieldInfo = {}

---Obtain the Length of the field.
---@return number len The length of the field.
function FieldInfo:__len()
    return 0
end

---Obtain the Offset of the field.
---@return number offset The offset of the field.
function FieldInfo:__unm()
    return 0
end

---Obtain the Value of the field.
---@return any value The value of the field.
function FieldInfo:__call()
    return 0
end

---The string representation of the field.
---@return string str The string representation.
function FieldInfo:__tostring()
    return ""
end

---Checks whether lhs is within rhs.
---@return boolean result True if lhs is within rhs.
function FieldInfo:__eq()
    return false
end

---Checks whether the end byte of lhs is before the end of rhs.
---@return boolean result True if the end byte of lhs is before the end of rhs.
function FieldInfo:__le()
    return false
end

---Checks whether the end byte of lhs is before the beginning of rhs.
---@return boolean result True if the end byte of lhs is before the beginning of rhs.
function FieldInfo:__lt()
    return false
end

---Obtain all fields from the current tree. Note this only gets whatever fields the underlying
---dissectors have filled in for this packet at this time - there may be fields applicable to the
---packet that simply aren't being filled in because at this time they're not needed for anything.
---@return FieldInfo[] fieldinfos Array of all FieldInfo objects from the current tree.
function all_field_infos()
    return {}
end

local function FieldInfo__test()
    local f = Field.new("ip.addr")
    local finfo_array = f.list()
    for i, finfo in ipairs(finfo_array) do
        local len = finfo.len
    end
end
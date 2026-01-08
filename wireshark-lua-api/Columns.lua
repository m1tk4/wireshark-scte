-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

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

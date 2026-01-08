-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

---@class PrivateTable
---PrivateTable represents the pinfo->private_table.
PrivateTable = {}

---Gets debugging type information about the private table.
---@return string info A string with all keys in the table, mostly for debugging.
function PrivateTable:__tostring()
    return ""
end

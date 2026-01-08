-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

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

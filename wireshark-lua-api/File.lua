-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_File.html#lua_class_File

---@class File
---A File object, passed into Lua as an argument by FileHandler callback functions (e.g., read_open, read, write, etc.).
---This behaves similarly to the Lua io library's file object, returned when calling io.open(),
---except in this case you cannot call file:close(), file:open(), nor file:setvbuf(), since Wireshark/TShark manages the opening and closing of files.
---You also cannot use the "io" library itself on this object.
---The purpose of this object is to hide the internal complexity of how Wireshark handles files,
---and instead provide a Lua interface that is familiar, by mimicking the io library.
---Note: A File object should never be stored/saved beyond the scope of the callback function it is passed in to.
File = {}

---Reads from the File, similar to Lua's file:read().
---See Lua 5.x ref manual for file:read().
---@param ... any Format specifiers.
---@return string|number|nil data The read data.
function File:read(...)
    return ""
end

---Seeks in the File, similar to Lua's file:seek().
---See Lua 5.x ref manual for file:seek().
---@param whence? string Optional. The base position ("set", "cur", or "end"). Default is "cur".
---@param offset? number Optional. The offset from whence. Default is 0.
---@return number position The current file cursor position as a number.
function File:seek(whence, offset)
    return 0
end

---Lua iterator function for retrieving ASCII File lines, similar to Lua's file:lines().
---See Lua 5.x ref manual for file:lines().
---@return function iterator The iterator function.
function File:lines()
    return function() return nil end
end

---Writes to the File, similar to Lua's file:write().
---See Lua 5.x ref manual for file:write().
---@param ... any Data to write.
---@return File file The File object on success.
function File:write(...)
    return self
end

---Generates a string of debug info for the File object.
---@return string debug String of debug information.
function File:__tostring()
    return ""
end

---Whether the File is compressed or not.
---@type boolean
File.compressed = false


local function File__test()
    local f = File
    local pos = f:seek("set", 0)
    local data = f:read(10)
    local success = f:write("hello world")
    for line in f:lines() do
        local l = line
    end
    local c = f.compressed
end
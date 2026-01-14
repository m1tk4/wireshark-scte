---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

---@class NSTime
---NSTime represents a nstime_t. This is an object with seconds and nanoseconds.
---@field secs number The NSTime seconds.
---@field nsecs number The NSTime nano seconds.
---@overload fun(seconds?:number, nseconds?:number): NSTime
---@operator add(NSTime): NSTime
---@operator sub(NSTime): NSTime
---@operator unm(): NSTime
NSTime = {}

---Creates a new NSTime object.
---@param seconds? number Seconds.
---@param nseconds? number Nano seconds.
---@return NSTime nstime The new NSTime object.
function NSTime.new(seconds, nseconds) end

---Creates a NSTime object.
---@param seconds? number Seconds.
---@param nseconds? number Nanoseconds.
---@return NSTime nstime The new NSTime object.
function NSTime:__call(seconds, nseconds) end

---Returns a Lua number of the NSTime representing seconds from epoch.
---@return number num The Lua number.
function NSTime:tonumber() end

---Returns the string representing the nstime.
---@return string str The string representing the nstime.
function NSTime:__tostring() end

---Calculates the sum of two NSTimes.
---@param t NSTime The NSTime to add.
---@return NSTime nstime The sum of two NSTimes.
function NSTime:__add(t) end

---Calculates the diff of two NSTimes.
---@param t NSTime The NSTime to subtract.
---@return NSTime nstime The difference of two NSTimes.
function NSTime:__sub(t) end

---Calculates the negative NSTime.
---@return NSTime nstime The negative NSTime.
function NSTime:__unm() end

---Compares two NSTimes.
---@param t NSTime The NSTime to compare.
---@return boolean
function NSTime:__eq(t) end

---Compares two NSTimes.
---@param t NSTime The NSTime to compare.
---@return boolean
function NSTime:__le(t) end

---Compares two NSTimes.
---@param t NSTime The NSTime to compare.
---@return boolean
function NSTime:__lt(t) end

-- Example usage:

local t = NSTime(1625079045, 123456789)
local s = t + t
s:tonumber()
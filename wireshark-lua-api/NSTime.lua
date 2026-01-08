-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

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

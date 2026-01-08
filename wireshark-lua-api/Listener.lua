-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Listener.html#lua_class_Listener

---@class Listener
---A Listener is called once for every packet that matches a certain filter or has a certain tap.
---It can read the tree, the packet's Tvb buffer as well as the tapped data, but it cannot add elements to the tree.
Listener = {}

---Creates a new Listener tap object.
---@param tap string|nil The name of this tap. See Listener.list() for valid listener names (optional).
---@param filter string|nil A display filter to apply to the tap. The tap.packet function will be called for each matching packet (optional, default is nil which matches every packet).
---@param allfields boolean|nil Whether to generate all fields. Note: This impacts performance (optional, default is false).
---@return Listener listener The newly created Listener listener object.
function Listener.new(tap, filter, allfields)
    return Listener
end

---Gets a Lua array table of all registered Listener tap names.
---Note: This is an expensive operation, and should only be used for troubleshooting.
---@return string[] tapnames The array table of registered tap names.
function Listener.list()
    return {}
end

---Removes a tap Listener.
function Listener:remove()
end

---Generates a string of debug info for the tap Listener.
---@return string info Debug info string.
function Listener:__tostring()
    return ""
end

---A function that will be called once every packet matches the Listener listener filter.
---When later called by Wireshark, the packet function will be given:
---1. A Pinfo object
---2. A Tvb object
---3. A tapinfo table (structure depends on the Listener type, or nil)
---
---Example:
---```lua
---function tap.packet(pinfo, tvb, tapinfo)
---    -- Process packet
---end
---```
---@type fun(pinfo: Pinfo, tvb: Tvb, tapinfo: table|nil)
Listener.packet = nil

---A function that will be called once every few seconds to redraw the GUI objects.
---In TShark this function is called only at the very end of the capture file.
---When later called by Wireshark, the draw function will not be given any arguments.
---
---Example:
---```lua
---function tap.draw()
---    -- Redraw GUI
---end
---```
---@type fun()
Listener.draw = nil

---A function that will be called at the end of the capture run.
---When later called by Wireshark, the reset function will not be given any arguments.
---
---Example:
---```lua
---function tap.reset()
---    -- Reset state
---end
---```
---@type fun()
Listener.reset = nil

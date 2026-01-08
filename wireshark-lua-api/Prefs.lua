---@meta

---The table of preferences of a protocol.
---@class Prefs
Prefs = {}

---Creates a new preference.
---
---# Example
---```lua
---proto_foo.prefs.bar = Pref.bool("Bar", true, "Baz and all the rest")
---```
---@param name string The abbreviation of this preference
---@param pref Pref A valid but still unassigned Pref object
function Prefs:__newindex(name, pref) end

---Get the value of a preference setting.
---
---# Example
---```lua
---debug("bar = " .. proto_foo.prefs.bar)
---```
---@param name string The abbreviation of this preference
---@return any # The current value of the preference
function Prefs:__index(name) end

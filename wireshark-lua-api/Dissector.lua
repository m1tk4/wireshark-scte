---@meta

--- A reference to a dissector, used to call a dissector against a packet or a part of it.
---@class Dissector
---@overload fun(tvb: Tvb, pinfo: Pinfo, tree: TreeItem): number
Dissector = {}

--- Obtains a dissector reference by name.
---@param name string The name of the dissector.
---@return Dissector|nil dissector The Dissector reference if found, otherwise nil.
function Dissector.get(name) end

--- Gets a Lua array table of all registered Dissector names.
--- Note: This is an expensive operation, and should only be used for troubleshooting.
---@return string[] names The array table of registered dissector names.
function Dissector.list() end

--- Calls a dissector against a given packet (or part of it).
---@param tvb Tvb The buffer to dissect.
---@param pinfo Pinfo The packet info.
---@param tree TreeItem The tree on which to add the protocol items.
---@return number bytes Number of bytes dissected. Note that some dissectors always return number of bytes in incoming buffer, so be aware.
function Dissector:call(tvb, pinfo, tree) end

--- Calls a dissector against a given packet (or part of it).
--- This is the metamethod that allows calling a Dissector object as a function.
---@param tvb Tvb The buffer to dissect.
---@param pinfo Pinfo The packet info.
---@param tree TreeItem The tree on which to add the protocol items.
---@return number bytes Number of bytes dissected.
function Dissector:__call(tvb, pinfo, tree) end

--- Calls a dissector against a given packet (or part of it).
---@param tvb Tvb The buffer to dissect.
---@param pinfo Pinfo The packet info.
---@param tree TreeItem The tree on which to add the protocol items.
---@return number bytes Number of bytes dissected.
---@return any content Decrypted content.
function Dissector:decrypt(tvb, pinfo, tree) end

--- Calls a dissector against a given packet (or part of it).
--- This is the metamethod for decryption operations.
---@param tvb Tvb The buffer to dissect.
---@param pinfo Pinfo The packet info.
---@param tree TreeItem The tree on which to add the protocol items.
---@return number bytes Number of bytes dissected.
---@return any content Decrypted content.
function Dissector:__decrypt(tvb, pinfo, tree) end

--- Gets the Dissector's description.
---@return string description A string of the Dissector's description.
function Dissector:__tostring() end

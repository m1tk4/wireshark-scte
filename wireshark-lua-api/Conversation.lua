-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

---@class Conversation
---Conversation object, used to attach conversation data or a conversation dissector.
Conversation = {}

---Searches for a Conversation instance matching criteria. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param framenum number The number of a frame within the conversation.
---@param ctype convtypes Conversation Type (e.g., convtypes.TCP, convtypes.UDP, etc.).
---@param addr1 Address First Address of the conversation.
---@param addr2? Address Second Address of the conversation. (defaults to nil)
---@param port1? number First port. A value of nil or 0 is treated as 'ignore' (default)
---@param port2? number Second port. A value of nil or 0 is treated as 'ignore' (default)
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find(framenum, ctype, addr1, addr2, port1, port2, create)
    return nil
end

---Searches for a Conversation object by id. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param framenum number The number of a frame within the conversation.
---@param ctype convtypes Conversation Type (e.g., convtypes.TCP, convtypes.UDP, etc.).
---@param id number Conversation or session specific ID.
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find_by_id(framenum, ctype, id, create)
    return nil
end

---Searches for a Conversation object matching a pinfo. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param pinfo Pinfo A Pinfo object.
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find_from_pinfo(pinfo, create)
    return nil
end

---Compares two Conversation objects.
---@return boolean result True if both objects refer to the same underlying conversation structure. False otherwise.
function Conversation:__eq()
    return false
end

---Returns a string representation of the Conversation object.
---@return string str A string representation of the object.
function Conversation:__tostring()
    return ""
end

---Sets protocol data for a specific protocol.
---@param index any The protocol index to set. Must be a Proto.
---@param value any The protocol data to set (any valid lua object).
function Conversation:__newindex(index, value)
end

---Get protocol data for a specific protocol.
---@param index any The protocol index to get. Must be a Proto.
---@return any|nil data Previously assigned conversation data, or nil.
function Conversation:__index(index)
    return nil
end

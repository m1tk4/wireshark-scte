---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html


-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html
-- https://github.com/wireshark/wireshark/blob/a63f9aeac496e2d4457624f4665a2cec549c2aeb/epan/wslua/wslua_conversation.c#L78 

---@class convtypes
---Conversation types for use with Conversation.find() and Conversation.find_by_id()
convtypes = {
    NONE = 0,
    SCTP = 1,
    TCP = 2,
    UDP = 3,
    DCCP = 4,
    IPX = 5,
    NCP = 6,
    EXCHG = 7,
    DDP = 8,
    SBCCS = 9,
    IDP = 10,
    TIPC = 11,
    USB = 12,
    I2C = 13,
    IBQP = 14,
    BLUETOOTH = 15,
    TDMOP = 16,
    DVBCI = 17,
    ISO14443 = 18,
    ISDN = 19,
    H223 = 20,
    X25 = 21,
    IAX2 = 22,
    DLCI = 23,
    ISUP = 24,
    BICC = 25,
    GSMTAP = 26,
    IUUP = 27,
    DVBBBF = 28,
    IWARP_MPA = 29,
    BT_UTP = 30,
    LOG = 31,
    LTP = 32,
    MCTP = 33,
    NVME_MI = 34,
    BP = 35,
    SNMP = 36,
    QUIC = 37,
    IDN = 38,
    IP = 39,
    IPV6 = 40,
    ETH = 41,
    ETH_NN = 42,
    ETH_NV = 43,
    ETH_IN = 44,
    ETH_IV = 45,
    VSPC_VMOTION = 46,
    OPENVPN = 47,
    PROXY = 48,
    DNP3 = 49,
}

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
function Conversation.find(framenum, ctype, addr1, addr2, port1, port2, create) end

---Searches for a Conversation object by id. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param framenum number The number of a frame within the conversation.
---@param ctype convtypes Conversation Type (e.g., convtypes.TCP, convtypes.UDP, etc.).
---@param id number Conversation or session specific ID.
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find_by_id(framenum, ctype, id, create) end

---Searches for a Conversation object matching a pinfo. If one does not exist and 'create' is true, one will be created, otherwise nil will be returned.
---@param pinfo Pinfo A Pinfo object.
---@param create? boolean If conversation doesn't exist, create it (default true)
---@return Conversation|nil conversation The found or created Conversation instance, or nil.
function Conversation.find_from_pinfo(pinfo, create) end

---Compares two Conversation objects.
---@return boolean result True if both objects refer to the same underlying conversation structure. False otherwise.
function Conversation:__eq() end

---Returns a string representation of the Conversation object.
---@return string str A string representation of the object.
function Conversation:__tostring() end

---Sets protocol data for a specific protocol.
---@param index any The protocol index to set. Must be a Proto.
---@param value any The protocol data to set (any valid lua object).
function Conversation:__newindex(index, value) end

---Get protocol data for a specific protocol.
---@param index any The protocol index to get. Must be a Proto.
---@return any|nil data Previously assigned conversation data, or nil.
function Conversation:__index(index) end

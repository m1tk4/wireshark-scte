---@meta

--- Expert information system for protocol analysis.
--- Contains group and severity constants for creating expert info fields.
expert = {}

--- Expert group constants for categorizing expert information.
expert.group = {
    --- Checksum validation issues
    CHECKSUM = 16777216, -- PI_CHECKSUM
    
    --- Sequence number issues
    SEQUENCE = 33554432, -- PI_SEQUENCE
    
    --- Response code issues
    RESPONSE_CODE = 50331648, -- PI_RESPONSE_CODE
    
    --- Request code issues
    REQUEST_CODE = 67108864, -- PI_REQUEST_CODE
    
    --- Undecoded data
    UNDECODED = 83886080, -- PI_UNDECODED
    
    --- Reassembly issues
    REASSEMBLE = 100663296, -- PI_REASSEMBLE
    
    --- Malformed packet
    MALFORMED = 117440512, -- PI_MALFORMED
    
    --- Debug information
    DEBUG = 134217728, -- PI_DEBUG
    
    --- Protocol issues
    PROTOCOL = 150994944, -- PI_PROTOCOL
    
    --- Security issues
    SECURITY = 167772160, -- PI_SECURITY
    
    --- Comments group
    COMMENTS_GROUP = 184549376, -- PI_COMMENTS_GROUP
    
    --- Decryption issues
    DECRYPTION = 201326592, -- PI_DECRYPTION
    
    --- Assumption made
    ASSUMPTION = 218103808, -- PI_ASSUMPTION
    
    --- Deprecated feature used
    DEPRECATED = 234881024, -- PI_DEPRECATED
    
    --- Receive issues
    RECEIVE = 251658240, -- PI_RECEIVE
    
    --- Interface issues
    INTERFACE = 268435456, -- PI_INTERFACE
}

--- Expert severity constants for indicating the importance level.
expert.severity = {
    --- Comment level (informational)
    COMMENT = 1048576, -- PI_COMMENT
    
    --- Chat level (minor informational)
    CHAT = 2097152, -- PI_CHAT
    
    --- Note level (notable information)
    NOTE = 4194304, -- PI_NOTE
    
    --- Warning level (potential issue)
    WARN = 6291456, -- PI_WARN
    
    --- Error level (definite problem)
    ERROR = 8388608, -- PI_ERROR
}

--- Legacy PI_* constants (DEPRECATED - use expert.group.* and expert.severity.* instead)

---@deprecated Use expert.group.ASSUMPTION instead
PI_ASSUMPTION = 218103808

---@deprecated Use expert.severity.CHAT instead
PI_CHAT = 2097152

---@deprecated Use expert.group.CHECKSUM instead
PI_CHECKSUM = 16777216

---@deprecated Use expert.severity.COMMENT instead
PI_COMMENT = 1048576

---@deprecated Use expert.group.COMMENTS_GROUP instead
PI_COMMENTS_GROUP = 184549376

---@deprecated Use expert.group.DEBUG instead
PI_DEBUG = 134217728

---@deprecated Use expert.group.DECRYPTION instead
PI_DECRYPTION = 201326592

---@deprecated Use expert.group.DEPRECATED instead
PI_DEPRECATED = 234881024

---@deprecated Dissector bug indicator (internal use)
PI_DISSECTOR_BUG = 285212672

---@deprecated Use expert.severity.ERROR instead
PI_ERROR = 8388608

---@deprecated Group mask constant (internal use)
PI_GROUP_MASK = -16777216

---@deprecated Use expert.group.INTERFACE instead
PI_INTERFACE = 268435456

---@deprecated Use expert.group.MALFORMED instead
PI_MALFORMED = 117440512

---@deprecated Use expert.severity.NOTE instead
PI_NOTE = 4194304

---@deprecated Use expert.group.PROTOCOL instead
PI_PROTOCOL = 150994944

---@deprecated Use expert.group.REASSEMBLE instead
PI_REASSEMBLE = 100663296

---@deprecated Use expert.group.RECEIVE instead
PI_RECEIVE = 251658240

---@deprecated Use expert.group.REQUEST_CODE instead
PI_REQUEST_CODE = 67108864

---@deprecated Use expert.group.RESPONSE_CODE instead
PI_RESPONSE_CODE = 50331648

---@deprecated Use expert.group.SECURITY instead
PI_SECURITY = 167772160

---@deprecated Use expert.group.SEQUENCE instead
PI_SEQUENCE = 33554432

---@deprecated Severity mask constant (internal use)
PI_SEVERITY_MASK = 15728640

---@deprecated Use expert.group.UNDECODED instead
PI_UNDECODED = 83886080

---@deprecated Use expert.severity.WARN instead
PI_WARN = 6291456


--- Protocol expert info field for adding items to the dissection tree.
--- Must be added to a `Proto.experts` table to be registered.
---@class ProtoExpert
ProtoExpert = {}

--- Creates a new `ProtoExpert` object for protocol expert information notices.
---@param abbr string Filter name of the expert info field (the string that is used in filters)
---@param text string The default text of the expert field
---@param group number Expert group type (see expert.group constants)
---@param severity number Expert severity type (see expert.severity constants)
---@return ProtoExpert # The newly created ProtoExpert object
function ProtoExpert.new(abbr, text, group, severity) end

--- Returns a string with debugging information about the ProtoExpert object.
---@return string # Debug information about the ProtoExpert
function ProtoExpert:__tostring() end

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

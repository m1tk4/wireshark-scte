---@meta

--- A new protocol in Wireshark. Protocols have several uses. The main one is to
--- dissect a protocol, but they can also be dummies used to register preferences for
--- other purposes.
---@class Proto
---@field prefs Prefs The preferences of this dissector (read-only).
---@field prefs_changed fun() The preferences changed routine of this dissector, a Lua function you define. The function is called when the protocol's preferences are changed. It is passed no arguments.
---@field init fun() The init routine of this dissector, a function you define. The init function is called when a new capture file is opened or when the open capture file is closed. It is passed no arguments.
---@field name string The name given to this dissector (read-only).
---@field description string The description given to this dissector (read-only).
---@field fields table The Lua table of this dissector's ProtoFields. ProtoFields added to this table are registered to the Proto (and any removed are deregistered if previously registered).
---@field experts table The expert info Lua table of this Proto.
Proto = {}

--- Creates a new Proto object.
---@param name string The name of the protocol.
---@param description string A Long Text description of the protocol (usually lowercase).
---@return Proto proto The newly created Proto object.
function Proto.new(name, description) end

--- Creates a Proto object.
--- This is the metamethod that allows calling Proto as a constructor.
---@param name string The name of the protocol.
---@param description string A Long Text description of the protocol (usually lowercase).
---@return Proto proto The new Proto object.
function Proto:__call(name, description) end


--- Registers a heuristic dissector function for this Proto protocol, for the given heuristic list name.
--- When later called, the passed-in function will be given: (1) A Tvb object, (2) A Pinfo object, (3) A TreeItem object.
--- The function must return true if the payload is for it, else false.
--- The function should perform as much verification as possible to ensure the payload is for it, and dissect the packet
--- (including setting TreeItem info and such) only if the payload is for it, before returning true or false.
--- Since version 1.99.1, this function also accepts a Dissector object as the second argument, to allow re-using the same
--- Lua code as the function proto.dissector(...). In this case, the Dissector must return a Lua number of the number of
--- bytes consumed/parsed: if 0 is returned, it will be treated the same as a false return for the heuristic; if a positive
--- or negative number is returned, then it will be treated the same as a true return for the heuristic, meaning the packet
--- is for this protocol and no other heuristic will be tried.
---@param listname string The heuristic list name this function is a heuristic for (e.g., "udp" or "infiniband.payload").
---@param func function|Dissector A Lua function that will be invoked for heuristic dissection, or a Dissector object.
function Proto:register_heuristic(listname, func) end


---The protocol’s dissector, a function you define.
---
---@type fun(buffer: Tvb, pinfo: Pinfo, tree: TreeItem)
Proto.dissector = nil

--- Creates a Proto object.
--- This is the metamethod that allows calling Proto as a constructor.
---@param name string The name of the protocol.
---@param description string A Long Text description of the protocol (usually lowercase).
---@return Proto proto The new Proto object.
function Proto(name, description) end

--- Global Functions for New Protocols And Dissectors

--- Make the TCP-layer invoke the given Lua dissection function for each PDU in the
--- TCP segment, of the length returned by the given get_len_func function.
--- This function is useful for protocols that run over TCP and that are either a
--- fixed length always, or have a minimum size and have a length field encoded within
--- that minimum portion that identifies their full length. For such protocols,
--- their protocol dissector function can invoke this dissect_tcp_pdus() function to make it easier to handle dissecting their protocol's messages
--- (i.e., their protocol data unit (PDU)). This function should not be used for
--- protocols whose PDU length cannot be determined from a fixed minimum portion, such as
--- HTTP or Telnet.
---@param tvb Tvb The Tvb buffer to dissect PDUs from.
---@param tree TreeItem TreeItem object passed to the dissect_func.
---@param min_header_size number The number of bytes in the fixed-length part of the PDU.
---@param get_len_func function A Lua function that will be called for each PDU, to determine the full length of the PDU. The called function will be given (1) the Tvb object of the whole Tvb (possibly reassembled), (2) the Pinfo object, and (3) an offset number of the index of the first byte of the PDU (i.e., its first header byte). The Lua function must return a Lua number of the full length of the PDU.
---@param dissect_func function A Lua function that will be called for each PDU, to dissect the PDU. The called function will be given (1) the Tvb object of the PDU's Tvb (possibly reassembled), (2) the Pinfo object, and (3) the TreeItem object. The Lua function must return a Lua number of the number of bytes read/handled, which would typically be the Tvb:len().
---@param desegment? boolean Whether to reassemble PDUs crossing TCP segment boundaries or not. (default=true)
function dissect_tcp_pdus(tvb, tree, min_header_size, get_len_func, dissect_func, desegment) end

--- Make a Proto protocol (with a dissector function) a post-dissector. It will be called for
--- every frame after dissection.
---@param proto Proto The protocol to be used as post-dissector.
---@param allfields? boolean Whether to generate all fields. Note: This impacts performance (default=false).
function register_postdissector(proto, allfields) end

--- TLS protocol will be started after this frame.
---@param tls_handle Dissector The tls dissector.
---@param pinfo Pinfo The packet's Pinfo.
---@param app_handle Dissector The app dissector.
function ssl_starttls_ack(tls_handle, pinfo, app_handle) end

--- TLS protocol is started with this frame.
---@param tls_handle Dissector The tls dissector.
---@param pinfo Pinfo The packet's Pinfo.
---@param app_handle Dissector The app dissector.
function ssl_starttls_post_ack(tls_handle, pinfo, app_handle) end


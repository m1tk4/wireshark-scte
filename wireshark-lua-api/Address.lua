---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

---@class Address
---Represents an address.
Address = {}

---Creates an Address Object representing an IPv4 address.
---@param hostname string The address or name of the IP host.
---@return Address address The Address object.
function Address.ip(hostname) end

---Creates an Address Object representing an IPv6 address.
---@param hostname string The address or name of the IP host.
---@return Address address The Address object.
function Address.ipv6(hostname) end

---Creates an Address Object representing an Ethernet address.
---@param eth string The Ethernet address.
---@return Address address The Address object.
function Address.ether(eth) end

---Returns the string representing the address.
---@return string str The string representing the address.
function Address:__tostring() end

---Compares two Addresses.
---@return boolean
function Address:__eq() end

---Compares two Addresses.
---@return boolean
function Address:__le() end

---Compares two Addresses.
---@return boolean
function Address:__lt() end

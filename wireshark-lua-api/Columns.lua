---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html

---@class Columns
---The Columns of the packet list.
---@field number string Frame number.
---@field abs_time string Absolute timestamp.
---@field utc_time string UTC timestamp.
---@field cls_time string CLS timestamp.
---@field rel_time string Relative timestamp.
---@field date string Absolute date and time.
---@field date_doy string Absolute year, day of year, and time.
---@field utc_date string UTC date and time.
---@field utc_date_doy string UTC year, day of year, and time.
---@field delta_time string Delta time from previous packet.
---@field delta_time_displayed string Delta time from previous displayed packet.
---@field src string Source address.
---@field src_res string Resolved source address.
---@field src_unres string Numeric source address.
---@field dl_src string Source data link address.
---@field dl_src_res string Resolved source data link address.
---@field dl_src_unres string Numeric source data link address.
---@field net_src string Source network address.
---@field net_src_res string Resolved source network address.
---@field net_src_unres string Numeric source network address.
---@field dst string Destination address.
---@field dst_res string Resolve destination address.
---@field dst_unres string Numeric destination address.
---@field dl_dst string Destination data link address.
---@field dl_dst_res string Resolved destination data link address.
---@field dl_dst_unres string Numeric destination data link address.
---@field net_dst string Destination network address.
---@field net_dst_res string Resolved destination network address.
---@field net_dst_unres string Numeric destination network address.
---@field src_port string Source port.
---@field src_port_res string Resolved source port.
---@field src_port_unres string Numeric source port.
---@field dst_port string Destination port.
---@field dst_port_res string Resolved destination port.
---@field dst_port_unres string Numeric destination port.
---@field protocol string Protocol name.
---@field info string General packet information.
---@field packet_len string Packet length.
---@field cumulative_bytes string Cumulative bytes in the capture.
---@field direction string Packet direction.
---@field vsan string Virtual SAN.
---@field tx_rate string Transmit rate.
---@field rssi string RSSI value.
---@field dce_call string DCE call.
Columns = {}

---Returns the string "Columns". This has no real use aside from debugging.
---@return string
function Columns:__tostring() end

---Sets the text of a specific column. Some columns cannot be modified, and no error is raised if attempted.
---The columns that are known to allow modification are "info" and "protocol".
---@param column string The name of the column to set (e.g. "info", "protocol", "src", "dst", etc.).
---@param text string The text for the column.
function Columns:__newindex(column, text) end

---Get a specific Column.
---@param column string The name of the column.
---@return Column column The Column object.
function Columns:__index(column) end

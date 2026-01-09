---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Dumper.html

---@class Dumper
---Dumper represents Wireshark's built-in file format writers for saving capture files to disk.
Dumper = {}

---Creates a file to write packets. Dumper:new_for_current() will probably be a better choice,
---especially for file types other than pcapng.
---@param filename string The name of the capture file to be created.
---@param filetype? number The type of the file to be created - a number returned by wtap_name_to_file_type_subtype(). Defaults to pcapng.
---@param encap? number The encapsulation to be used - a number entry from the wtap_encaps table. Defaults to per-packet encapsulation for pcapng and Ethernet for other file types.
---@return Dumper dumper The newly created Dumper object.
function Dumper.new(filename, filetype, encap) end

---Closes a dumper.
function Dumper:close() end

---Writes all unsaved data of a dumper to the disk.
function Dumper:flush() end

---Dumps an arbitrary packet. Note: Dumper:dump_current() will fit best in most cases.
---@param timestamp NSTime The absolute timestamp the packet will have.
---@param pseudoheader PseudoHeader The PseudoHeader to use.
---@param bytearray ByteArray The data to be saved.
function Dumper:dump(timestamp, pseudoheader, bytearray) end

---Creates a capture file using the same encapsulation as the one of the current packet.
---@param filetype? number The file type. Defaults to pcapng.
---@return Dumper dumper The newly created Dumper object.
function Dumper:new_for_current(filetype) end

---Dumps the current packet as it is.
function Dumper:dump_current() end

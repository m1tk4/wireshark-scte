---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_File.html#lua_class_FileHandler

---@class FileHandler
---A FileHandler object, created by a call to FileHandler.new(arg1, arg2, ...).
---The FileHandler object lets you create a file-format reader, or writer, or both,
---by setting your own read_open/read or write_open/write functions.
FileHandler = {}

---Creates a new FileHandler.
---@param description string A description of the file type, for display purposes only. E.g., "Wireshark - pcapng"
---@param name string The file type name, used to look up the file type in various places. E.g., "pcapng". Note: The name cannot already be in use.
---@param internal_description string Descriptive text about this file format, for internal display purposes only.
---@param type string The type of FileHandler, "r"/"w"/"rw" for reader/writer/both, include "m" for magic, "s" for strong heuristic.
---@return FileHandler filehandler The newly created FileHandler object.
function FileHandler.new(description, name, internal_description, type) end

---Generates a string of debug info for the FileHandler.
---@return string debug String of debug information.
function FileHandler:__tostring() end

---The Lua function to be called when Wireshark opens a file for reading.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfo object
---The called Lua function should return true if the file is its type (it accepts it), false if not.
---The Lua function must also set the File offset position (using file:seek()) to where it wants it to be for its first read() call.
---@type fun(file: File, capture: CaptureInfo): boolean
FileHandler.read_open = nil

---The Lua function to be called when Wireshark wants to read a packet from the file.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfo object
---3. A FrameInfo object
---The called Lua function should return the file offset/position number where the packet begins, or false if it hit an error.
---@type fun(file: File, capture: CaptureInfo, frame: FrameInfo): number|boolean
FileHandler.read = nil

---The Lua function to be called when Wireshark wants to read a packet from the file at the given offset.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfo object
---3. A FrameInfo object
---4. The file offset number previously set by the read() function call
---The called Lua function should return true if the read was successful, or false if it hit an error.
---Since 2.4.0, a number is also acceptable to signal success.
---Since 3.6.0, it's possible to omit the FileHandler:seek_read() function to get a default seek_read implementation.
---@type fun(file: File, capture: CaptureInfo, frame: FrameInfo, offset: number): boolean|number
FileHandler.seek_read = nil

---The Lua function to be called when Wireshark wants to close the read file completely.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfo object
---It is not necessary to set this field to a Lua function.
---@type fun(file: File, capture: CaptureInfo)|nil
FileHandler.read_close = nil

---The Lua function to be called when Wireshark wants to close the sequentially-read file.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfo object
---After this point, there will be no more calls to read(), only seek_read().
---@type fun(file: File, capture: CaptureInfo)|nil
FileHandler.seq_read_close = nil

---The Lua function to be called when Wireshark wants to write a file, by checking if this file writer can handle the wtap packet encapsulation(s).
---When later called by Wireshark, the Lua function will be given a Lua number, which matches one of the encapsulations in the Lua wtap_encaps table.
---If the Lua file writer can write the given type of encapsulation into a file, then it returns the boolean true, else false.
---@type fun(encap: number): boolean
FileHandler.can_write_encap = nil

---The Lua function to be called when Wireshark opens a file for writing.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfoConst object
---The called Lua function should return true on success, or false if it hit an error.
---Also make sure to set the FileHandler.write (and potentially FileHandler.write_finish) functions before returning true from this function.
---@type fun(file: File, capture: CaptureInfoConst): boolean
FileHandler.write_open = nil

---The Lua function to be called when Wireshark wants to write a packet to the file.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfoConst object
---3. A FrameInfoConst object of the current frame/packet to be written
---The called Lua function should return true on success, or false if it hit an error.
---@type fun(file: File, capture: CaptureInfoConst, frame: FrameInfoConst): boolean
FileHandler.write = nil

---The Lua function to be called when Wireshark wants to close the written file.
---When later called by Wireshark, the Lua function will be given:
---1. A File object
---2. A CaptureInfoConst object
---It is not necessary to set this field to a Lua function.
---@type fun(file: File, capture: CaptureInfoConst)|nil
FileHandler.write_finish = nil

---The internal file type. This is automatically set with a new number when the FileHandler is registered.
---@type number
FileHandler.type = 0

---One or more semicolon-separated file extensions that this file type usually uses.
---For readers using heuristics to determine file type, Wireshark will try the readers of the file's extension first, before trying other readers.
---For writers (since 2.6), the first extension is used to suggest the default file extension.
---@type string
FileHandler.extensions = ""

---True if the ability to seek is required when writing this file format, else false.
---This will be checked by Wireshark when writing out to compressed file formats, because seeking is not possible with compressed files.
---@type boolean
FileHandler.writing_must_seek = false

---True if the file format supports name resolution records, else false.
---@type boolean
FileHandler.writes_name_resolution = false

---Set to the bit-wise OR'ed number representing the type of comments the file writer supports writing, based on the numbers in the wtap_comments table.
---@type number
FileHandler.supported_comment_types = 0

---Register the FileHandler into Wireshark/TShark, so they can read/write this new format.
---All functions and settings must be complete before calling this registration function.
---This function cannot be called inside the reading/writing callback functions.
---@param filehandler FileHandler The FileHandler object to be registered.
---@return number type The new type number for this file reader/writer.
function register_filehandler(filehandler) end

---Deregister the FileHandler from Wireshark/TShark, so it no longer gets used for reading/writing/display.
---This function cannot be called inside the reading/writing callback functions.
---@param filehandler FileHandler The FileHandler object to be deregistered.
function deregister_filehandler(filehandler) end

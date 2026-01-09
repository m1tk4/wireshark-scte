---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Dir.html

---@class Dir
---A Directory object for handling directory operations.
Dir = {}

---Creates a directory.
---The created directory is set for permission mode 0755 (octal).
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true on success, false if the directory already exists, nil on error.
function Dir.make(name) end

---Returns true if the given directory name exists.
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true if the directory exists, false if it's a file, nil on error or not-exist.
function Dir.exists(name) end

---Removes an empty directory.
---This function only removes empty directories. To remove a directory regardless, use Dir.remove_all().
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true on success, false if does not exist, nil on error.
function Dir.remove(name) end

---Removes an empty or non-empty directory.
---@param name string The name of the directory, possibly including path.
---@return boolean|nil result Boolean true on success, false if does not exist, nil on error.
function Dir.remove_all(name) end

---Opens a directory and returns a Dir object representing the files in the directory.
---@param pathname string The pathname of the directory.
---@param extension? string If given, only files with this extension will be returned.
---@return Dir dir The Dir object.
function Dir.open(pathname, extension) end

---Gets the personal configuration directory path, with filename if supplied.
---@param filename? string A filename.
---@return string path The full pathname for a file in the personal configuration directory.
function Dir.personal_config_path(filename) end

---Gets the global configuration directory path, with filename if supplied.
---@param filename? string A filename
---@return string path The full pathname for a file in Wireshark's configuration directory.
function Dir.global_config_path(filename) end

---Gets the personal plugins directory path.
---@return string path The pathname of the personal plugins directory.
function Dir.personal_plugins_path() end

---Gets the global plugins directory path.
---@return string path The pathname of the global plugins directory.
function Dir.global_plugins_path() end

---Gets the next file or subdirectory within the directory, or nil when done.
---@return string|nil filename The next filename or nil when done.
function Dir:__call() end

---Gets the next file or subdirectory within the directory, or nil when done.
---@return string|nil filename The next filename or nil when done.
function Dir() end

---Closes the directory. Called automatically during garbage collection of a Dir object.
function Dir:close() end


local function Dir__test__()

    local d = Dir.open("somepath", "txt")
    if d then
        for fname in d do
            print("Found file: " .. fname)
        end
        d:close()
    end
    d:personal_plugins_path()

    for filename in Dir.open('/path/to/dir') do
        print(filename)
    end

end

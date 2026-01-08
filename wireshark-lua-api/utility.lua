-- Using annotations available to VSCode Lua Extension:
-- https://luals.github.io/wiki/annotations/

---Gets the Wireshark version as a string.
---@return string 
function get_version()
    return "1.0.0"
end

---@class WiresharkPluginInfo
---@field version string Plugin version
---@field description? string Plugin description
---@field author? string Author's name
---@field repository? string URL to the plugin's repository

---Set a Lua table with meta-data about the plugin, such as version, author name, etc.
---[(details)](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm_modules.html#lua_fn_set_plugin_info_table_) .
---@see WiresharkPluginInfo
---@param table WiresharkPluginInfo
function set_plugin_info(table)
end

---Formats an absolute timestamp into a human readable date.
---@return string
---@param timestamp NSTime The timestamp to be formatted.
function format_date(timestamp)
    return "2024-01-01 00:00:00"
end

---Formats a relative timestamp in a human readable time.
---@return string
---@param timestamp NSTime The timestamp to be formatted.
function format_time(timestamp)
    return "2024-01-01 00:00:00"
end

---Get a preference value.
---@return any
---@param preference string The name of the preference.
function get_preference(preference)
    return nil
end

---Set a preference value.
---@param preference string The name of the preference.
---@param value any The value to be set.
function set_preference(preference, value)
end

---Reset a preference to its default value. Returns true on success.
---@return boolean
---@param preference string The name of the preference.
function reset_preference(preference)
    return true
end

---Write preferences to file and apply changes
function apply_preferences()
end

---Reports a failure to the user.
---@param text string message text to report
function report_failure(text)
end

---Loads a Lua file and executes it as a Lua chunk, similar to the standard dofile but searches additional directories.
---The search order is the current directory, followed by the user's personal configuration directory, and finally the global configuration directory.
---@param filename string Name of the file to be run. If the file does not exist in the current directory, the user and system directories are searched.
function dofile(filename)
end

---Loads a Lua file and compiles it into a Lua chunk, similar to the standard loadfile but searches additional directories.
---The search order is the current directory, followed by the user's personal configuration directory, and finally the global configuration directory.
---@param filename string Name of the file to be loaded. If the file does not exist in the current directory, the user and system directories are searched.
---@return function|nil chunk The compiled chunk as a function, or nil on error.
function loadfile(filename)
    return nil
end

---Register a function to handle a -z option.
---@param argument string The name of the option argument.
---@param action? function The function to be called when the command is invoked.
function register_stat_cmd_arg(argument, action)
end

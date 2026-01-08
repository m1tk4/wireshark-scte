-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Gui.html

---Menu group constants for register_menu()
MENU_PACKET_ANALYZE_UNSORTED = 0
MENU_PACKET_STAT_UNSORTED = 1
MENU_STAT_GENERIC = 2
MENU_STAT_RESPONSE_TIME = 3
MENU_STAT_RSERPOOL = 4
MENU_TELEPHONY_UNSORTED = 5
MENU_TELEPHONY_ANSI = 6
MENU_TELEPHONY_GSM = 7
MENU_TELEPHONY_3GPP_UU = 8
MENU_TELEPHONY_MTP3 = 9
MENU_TELEPHONY_SCTP = 10
MENU_TOOLS_UNSORTED = 11
MENU_LOG_ANALYZE_UNSORTED = 12
MENU_LOG_STAT_UNSORTED = 13

---Checks if we're running inside a GUI (i.e. Wireshark) or not.
---@return boolean gui_available True if a GUI is available, false if it isn't.
function gui_enabled()
    return false
end

---Register a menu item in one of the main menus. Requires a GUI.
---@param name string The name of the menu item. Use slashes to separate submenus (e.g., "Lua Scripts/My Fancy Statistics").
---@param action function The function to be called when the menu item is invoked. Must take no arguments and return nothing.
---@param group? number Where to place the item in the menu hierarchy. Defaults to MENU_STAT_GENERIC.
function register_menu(name, action, group)
end

---Register a menu item in the packet list.
---@param name string The name of the menu item. Use slashes to separate submenus (e.g., "level1/level2/name").
---@param action function The function to be called when the menu item is invoked. Takes variable number of FieldInfo objects.
---@param required_fields? string A comma-separated list of packet fields (e.g., "http.host,dns.qry.name") which all must be present for the menu to be displayed.
function register_packet_menu(name, action, required_fields)
end

---Displays a dialog, prompting for input. The dialog includes an OK button and Cancel button. Requires a GUI.
---@param title string The title of the dialog.
---@param action function Action to be performed when the user presses OK.
---@param ... string|table Strings to be used as labels of the dialog's fields, or tables with 'name' and 'value' fields.
function new_dialog(title, action, ...)
end

---Rescans all packets and runs each tap listener without reconstructing the display.
function retap_packets()
end

---Copy a string into the clipboard. Requires a GUI.
---@param text string The string to be copied into the clipboard.
function copy_to_clipboard(text)
end

---Open and display a capture file. Requires a GUI.
---@param filename string The name of the file to be opened.
---@param filter string The display filter to be applied once the file is opened.
function open_capture_file(filename, filter)
end

---Get the main filter text.
---@return string filter The current filter text.
function get_filter()
    return ""
end

---Set the main filter text.
---@param text string The filter's text.
function set_filter(text)
end

---Gets the current packet coloring rule (by index) for the current session.
---Wireshark reserves 10 slots for these coloring rules. Requires a GUI.
---@param row number The index (1-10) of the desired color filter value in the temporary coloring rules list.
---@return string filter The current display filter for the specified color filter slot.
function get_color_filter_slot(row)
    return ""
end

---Sets a packet coloring rule (by index) for the current session.
---Wireshark reserves 10 slots for these coloring rules. Requires a GUI.
---@param row number The index (1-10) of the desired color in the temporary coloring rules list.
---@param text string The display filter for selecting packets to be colorized.
function set_color_filter_slot(row, text)
end

---Apply the filter in the main filter box. Requires a GUI.
---Warning: Avoid calling this from within a dissector function or else an infinite loop can occur.
function apply_filter()
end

---Reload the current capture file. Deprecated. Use reload_packets() instead.
function reload()
end

---Reload the current capture file. Requires a GUI.
---Warning: Avoid calling this from within a dissector function or else an infinite loop can occur.
function reload_packets()
end

---Redissect all packets in the current capture file. Requires a GUI.
---Warning: Avoid calling this from within a dissector function or else an infinite loop can occur.
function redissect_packets()
end

---Reload all Lua plugins.
function reload_lua_plugins()
end

---Opens an URL in a web browser. Requires a GUI.
---Warning: Do not pass an untrusted URL to this function.
---@param url string The url.
function browser_open_url(url)
end

---Open a file located in the data directory in the web browser. Requires a GUI.
---If the file does not exist, the function silently ignores the request.
---Warning: Do not pass an untrusted URL to this function.
---@param filename string The file name.
function browser_open_data_file(filename)
end

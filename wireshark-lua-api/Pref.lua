---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Proto.html#lua_class_Pref

---@class Pref
---A preference of a Proto.
Pref = {}

---Creates a boolean preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default boolean The default value for this preference.
---@param description string A description of this preference.
---@return Pref pref The newly created Pref object.
function Pref.bool(label, default, description) end

---Creates an (unsigned) integer preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default number The default value for this preference.
---@param description string A description of what this preference is.
---@return Pref pref The newly created Pref object.
function Pref.uint(label, default, description) end

---Creates a string preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default string The default value for this preference.
---@param description string A description of what this preference is.
---@return Pref pref The newly created Pref object.
function Pref.string(label, default, description) end

---Creates an enum preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default number The default value for this preference.
---@param description string A description of what this preference is.
---@param enum table An enum Lua table with entries like { { 1, "Off", OUTPUT_OFF }, { 2, "Debug", OUTPUT_DEBUG }, ... }.
---@param radio boolean Radio button (true) or Combobox (false).
---@return Pref pref The newly created Pref object.
function Pref.enum(label, default, description, enum, radio) end

---Creates a range (numeric text entry) preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default string The default value for this preference, e.g., "53", "10-30", or "10-30,53,55,100-120".
---@param description string A description of what this preference is.
---@param max number The maximum value.
---@return Pref pref The newly created Pref object.
function Pref.range(label, default, description, max) end

---Creates a static text string to be added to a Proto.prefs Lua table.
---@param label string The static text.
---@param description string The static text description.
---@return Pref pref The newly created Pref object.
function Pref.statictext(label, description) end

---Creates an uat preference to be added to a Proto.prefs Lua table, or read an existent uat table content, and returns in a table.
---All returned cell content is in string format.
---@param label string The Label for this preference. In case of existent uat table reading, this argument contains the uat name, and all other argument is omitted.
---@param field_config? table Optional. Fields names and description table, e.g., { {"field 1", "Description 1"}, {"field 2", "Description 2"} }.
---@param description? string Optional. A description of what this preference is.
---@param file_name? string Optional. The name of the uat file.
---@return Pref|table pref The newly created Pref object, or a table with uat content if reading an existing uat.
function Pref.uat(label, field_config, description, file_name) end

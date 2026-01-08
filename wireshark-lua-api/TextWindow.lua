-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Gui.html

---@class TextWindow
---Creates and manages a text window. The text can be read-only or editable, and buttons can be added below the text.
---Requires a GUI.
TextWindow = {}

---Creates a new TextWindow text window and displays it. Requires a GUI.
---@param title? string Title of the new window. Defaults to "Untitled Window".
---@return TextWindow textwindow The newly created TextWindow object.
function TextWindow.new(title)
    return TextWindow()
end

---Set the function that will be called when the text window closes.
---@param action function A Lua function to be executed when the user closes the text window.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:set_atclose(action)
    return self
end

---Sets the text to be displayed.
---@param text string The text to be displayed.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:set(text)
    return self
end

---Appends text to the current window contents.
---@param text string The text to be appended.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:append(text)
    return self
end

---Prepends text to the current window contents.
---@param text string The text to be prepended.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:prepend(text)
    return self
end

---Erases all of the text in the window.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:clear()
    return self
end

---Get the text of the window.
---@return string text The TextWindow's text.
function TextWindow:get_text()
    return ""
end

---Close the window.
function TextWindow:close()
end

---Make this text window editable.
---@param editable? boolean True to make the text editable, false otherwise. Defaults to true.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:set_editable(editable)
    return self
end

---Adds a button with an action handler to the text window.
---@param label string The button label.
---@param func function The Lua function to be called when the button is pressed.
---@return TextWindow textwindow The TextWindow object.
function TextWindow:add_button(label, func)
    return self
end


local function TextWindow__test()

    if not gui_enabled() then return end

    -- create new text window and initialize its text
    local win = TextWindow.new("Log")
    win:set("Hello world!")

    -- add buttons to clear text window and to enable editing
    win:add_button("Clear", function() win:clear() end)
    win:add_button("Enable edit", function() win:set_editable(true) end)

    -- add button to change text to uppercase
    win:add_button("Uppercase", function()
            local text = win:get_text()
            if text ~= "" then
                    win:set(string.upper(text))
            end
    end)

    -- print "closing" to stdout when the user closes the text window
    win:set_atclose(function() print("closing") end)

end
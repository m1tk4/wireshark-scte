# GitHub Copilot Instructions for wireshark-scte

## Project Overview

This project provides Wireshark Lua dissectors for SCTE (Society of Cable Telecommunications Engineers) protocols, primarily SCTE-104 (Automation System to Compression System Communications over TCP).

## Key Standards and References

- **SCTE-104 2023**: Main protocol specification for TCP-based splice message insertion
- **SCTE-35 2023r1**: Digital Program Insertion Cueing Message specification (used within SCTE-104)
- **Wireshark Lua API**: Version 4.6.2 documentation at https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html

## Project Structure

```
scte104.lua              # Main dissector - primary work happens here
wireshark-lua-api/       # Type annotations for IntelliSense (DO NOT MODIFY)
tests/
  samples/               # .pcap capture files for testing
  *.expected             # Expected dissector output for test validation
  test_samples.spec.js   # Mocha test suite
  watch_sample.js        # Development watch mode
  update_expected.js     # Generate/update .expected files
  TestTShark.ps1         # PowerShell wrapper for tshark
  TestWireshark.ps1      # Launch Wireshark with all plugins
package.json             # NPM scripts and dependencies
.github/workflows/       # CI/CD automation
```

## Development Workflow

### Running Tests
```bash
npm test                              # Run all tests
npm run watch-sample <filename>       # Watch mode for specific file
npm run update-expected <pattern>     # Update expected outputs
npm run wireshark                     # Launch Wireshark GUI
```

### Code Organization in scte104.lua

1. **Lookup Tables**: Define at the top (OPID_*, RESULT_CODES, TIME_TYPES, etc.)
   - Use format: `[0x0001] = "operation_name()"`
   - Include comments with standard references (e.g., "Table 8-1")

2. **ProtoFields**: Define protocol fields before dissector function
   - Use descriptive names: `pf_opid`, `pf_result`, `pf_timestamp`
   - Include base display format: `base.DEC`, `base.HEX`, etc.
   - For bitfields, use masks: `ProtoField.bool("name", "desc", 8, nil, 0x80)`

3. **Parse Functions**: Create separate functions for complex structures
   - Pattern: `local function Parse_<structure_name>(buffer, offset, tree)`
   - Return new offset after parsing
   - Add fields to tree with appropriate subtrees

4. **Time Handling**: 
   - SCTE-104 epoch: January 6, 1980 00:00:00 UTC
   - Conversion to Unix: `unix_seconds = scte104_seconds + 315964800`
   - Display with microseconds: `os.date("!%Y-%m-%d %H:%M:%S", seconds) .. string.format(".%06d UTC", usec)`

### Coding Conventions

- **Indentation**: Use spaces (current file style)
- **Comments**: Include standard references for all lookup table values
- **Error Handling**: Validate buffer length before accessing
- **Tree Structure**: Use subtrees for complex structures to keep hierarchy clean
- **Value Strings**: Always provide lookup tables for enumerated values

### Common Patterns

**Adding a new operation parser:**
```lua
-- 1. Add to lookup table
local OPID_MULTI_OP = {
    [0x0101] = "splice_request_data()",
    [0x0102] = "new_operation_data()",  -- Add here
}

-- 2. Create parse function
local function Parse_new_operation_data(buffer, offset, tree)
    local subtree = tree:add(scte104_proto, buffer(offset, length), "New Operation Data")
    -- Add fields here
    return offset + length
end

-- 3. Add case in Parse_operation
if opid == 0x0102 then
    offset = Parse_new_operation_data(buffer, offset, tree)
end
```

**Displaying bitfields:**
```lua
-- Define individual bit fields with masks
local pf_flags = ProtoField.uint8("scte104.flags", "Flags", base.HEX)
local pf_flag_bit7 = ProtoField.bool("scte104.flags.bit7", "Bit 7", 8, nil, 0x80)
local pf_flag_bit6 = ProtoField.bool("scte104.flags.bit6", "Bit 6", 8, nil, 0x40)

-- Add parent then children
local flags_tree = tree:add(pf_flags, buffer(offset, 1))
flags_tree:add(pf_flag_bit7, buffer(offset, 1))
flags_tree:add(pf_flag_bit6, buffer(offset, 1))
```

**ASCII validation for strings:**
```lua
local function is_ascii_printable(buffer, offset, length)
    for i = 0, length - 1 do
        local byte = buffer(offset + i, 1):uint()
        if byte < 0x20 or byte > 0x7E then
            return false
        end
    end
    return true
end
```

### Testing

- **Test files**: Place `.pcap` files in `tests/samples/`
- **Naming convention**: `<dissector>-<description>.pcap` (e.g., `scte104-init-alive.pcap`)
- **Expected files**: Auto-generated, don't hand-edit (use `npm run update-expected`)
- **Test framework**: Mocha extracts dissector name from filename prefix
- **Skipping tests**: Tests without `.expected` files are automatically skipped

### Release Process

1. Update version in `scte104.lua` (line 13: `local release = "x.y.z"`)
2. Commit changes
3. Create and push tag: `git tag vX.Y.Z && git push --tags`
4. GitHub Actions automatically creates release with updated `.lua` files

### Important Notes

- **wireshark-lua-api/**: These are type annotations only - don't modify unless fixing type definitions
- **Epoch offset**: 315964800 seconds between Unix epoch (1970) and GPS/SCTE epoch (1980)
- **Leap seconds**: Already included in SCTE-104 timestamps (no additional adjustment needed)
- **Port number**: SCTE-104 uses TCP port 5167
- **Endianness**: All SCTE-104 multi-byte values are big-endian (network order)

### Useful Wireshark Lua API Patterns

```lua
-- Read values
local value = buffer(offset, length):uint()     -- Unsigned int
local value = buffer(offset, length):le_uint()  -- Little-endian
local str = buffer(offset, length):string()     -- ASCII string

-- Display timestamps
local nstime = NSTime.new(seconds, nanoseconds)
tree:add(pf_time, buffer(offset, 8), nstime)

-- Conditional display
local item = tree:add(pf_field, buffer(offset, len))
if value ~= 0 then
    item:append_text(" (custom info)")
end

-- Expert info (warnings/errors)
tree:add_proto_expert_info(expert_info_object)
```

### Common Tasks for AI Assistants

When asked to:
- **"Add support for operation X"**: Follow the pattern in "Adding a new operation parser" above
- **"Populate table from standard"**: User will provide copy-pasted data from PDF, format as Lua table
- **"Add test sample"**: Create `.pcap` file in `tests/samples/`, run `npm run update-expected`
- **"Fix dissection issue"**: Check buffer bounds, verify offset calculations, validate lookup tables
- **"Improve display"**: Add `append_text()`, create subtrees, use appropriate base formats

### Style Preferences

- Prefer explicit over implicit (e.g., `buffer(offset, 4):uint()` not relying on defaults)
- Use descriptive variable names (`segmentation_type_id` not `st`)
- Comment non-obvious calculations (especially time conversions, bit operations)
- Group related ProtoFields together with blank lines between groups
- Keep Parse functions focused on single structure - split if too complex

### Resources

- Wireshark Lua API: https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html
- SCTE Standards: https://www.scte.org/standards/
- Sample captures can be generated using the test infrastructure or provided by user

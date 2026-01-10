---@meta

-- Encoding constants for use with TreeItem:add_packet_field() and other functions

--- Endianness constants
ENC_BIG_ENDIAN = 0          -- Big endian (network order)
ENC_LITTLE_ENDIAN = -2147483648  -- Little endian
ENC_HOST_ENDIAN = -2147483648    -- Host endian
ENC_ANTI_HOST_ENDIAN = 0    -- Opposite of host endian

--- Basic encoding values
ENC_NA = 0                  -- Not applicable

--- Character encoding constants
ENC_ASCII = 0               -- ASCII encoding
ENC_UTF_8 = 2               -- UTF-8 encoding
ENC_UTF_16 = 4              -- UTF-16 encoding
ENC_UCS_2 = 6               -- UCS-2 encoding
ENC_UCS_4 = 8               -- UCS-4 encoding
ENC_ISO_646_IRV = 0         -- ISO 646 IRV
ENC_ISO_646_BASIC = 66      -- ISO 646 basic
ENC_ISO_8859_1 = 10         -- ISO 8859-1 (Latin-1)
ENC_ISO_8859_2 = 12         -- ISO 8859-2 (Latin-2)
ENC_ISO_8859_3 = 14         -- ISO 8859-3
ENC_ISO_8859_4 = 16         -- ISO 8859-4
ENC_ISO_8859_5 = 18         -- ISO 8859-5
ENC_ISO_8859_6 = 20         -- ISO 8859-6
ENC_ISO_8859_7 = 22         -- ISO 8859-7
ENC_ISO_8859_8 = 24         -- ISO 8859-8
ENC_ISO_8859_9 = 26         -- ISO 8859-9
ENC_ISO_8859_10 = 28        -- ISO 8859-10
ENC_ISO_8859_11 = 30        -- ISO 8859-11
ENC_ISO_8859_13 = 34        -- ISO 8859-13
ENC_ISO_8859_14 = 36        -- ISO 8859-14
ENC_ISO_8859_15 = 38        -- ISO 8859-15
ENC_ISO_8859_16 = 40        -- ISO 8859-16
ENC_WINDOWS_1250 = 42       -- Windows-1250
ENC_WINDOWS_1251 = 60       -- Windows-1251
ENC_WINDOWS_1252 = 58       -- Windows-1252
ENC_3GPP_TS_23_038_7BITS = 44           -- 3GPP TS 23.038 7 bits
ENC_3GPP_TS_23_038_7BITS_PACKED = 44    -- 3GPP TS 23.038 7 bits packed
ENC_3GPP_TS_23_038_7BITS_UNPACKED = 76  -- 3GPP TS 23.038 7 bits unpacked
ENC_EBCDIC = 46             -- EBCDIC
ENC_EBCDIC_CP037 = 56       -- EBCDIC CP037
ENC_EBCDIC_CP500 = 96       -- EBCDIC CP500
ENC_MAC_ROMAN = 48          -- Mac Roman
ENC_CP437 = 50              -- Code Page 437
ENC_ASCII_7BITS = 52        -- ASCII 7 bits
ENC_T61 = 54                -- T.61
ENC_CP855 = 62              -- Code Page 855
ENC_CP866 = 64              -- Code Page 866
ENC_BCD_DIGITS_0_9 = 68     -- BCD digits 0-9
ENC_KEYPAD_ABC_TBCD = 70    -- Keypad ABC TBCD
ENC_KEYPAD_BC_TBCD = 72     -- Keypad BC TBCD
ENC_ETSI_TS_102_221_ANNEX_A = 78  -- ETSI TS 102 221 Annex A
ENC_GB18030 = 80            -- GB 18030
ENC_EUC_KR = 82             -- EUC-KR
ENC_APN_STR = 84            -- APN string
ENC_DECT_STANDARD_8BITS = 86     -- DECT standard 8 bits
ENC_DECT_STANDARD_4BITS_TBCD = 88  -- DECT standard 4 bits TBCD

--- Character encoding masks
ENC_CHARENCODING_MASK = 65534  -- Character encoding mask
ENC_STR_MASK = 65534           -- String mask

--- BCD encoding flags
ENC_BCD_ODD_NUM_DIG = 65536    -- BCD odd number of digits
ENC_BCD_SKIP_FIRST = 131072    -- BCD skip first digit

--- String encoding flags
ENC_STR_NUM = 16777216         -- String as number
ENC_STR_HEX = 33554432         -- String as hex
ENC_STRING = 50331648          -- String

--- Byte-order mark
ENC_BOM = 536870912            -- Byte-order mark

--- Zigbee encoding
ENC_ZIGBEE = 1073741824        -- Zigbee encoding

--- Date/time encoding constants
ENC_ISO_8601_DATE = 65536           -- ISO 8601 date format
ENC_ISO_8601_TIME = 131072          -- ISO 8601 time format
ENC_ISO_8601_DATE_TIME = 196608     -- ISO 8601 date and time format
ENC_RFC_822 = 262144                -- RFC 822 date/time format
ENC_RFC_1123 = 262144               -- RFC 1123 date/time format
ENC_IMF_DATE_TIME = 262144          -- IMF date/time format
ENC_ISO_8601_DATE_TIME_BASIC = 1048576  -- ISO 8601 basic date/time format
ENC_NUM_PREF = 2097152              -- Numeric preference

--- Separator constants for string encoding
ENC_SEP_NONE = 65536           -- No separator
ENC_SEP_COLON = 131072         -- Colon separator
ENC_SEP_DASH = 262144          -- Dash separator
ENC_SEP_DOT = 524288           -- Dot separator
ENC_SEP_SPACE = 1048576        -- Space separator
ENC_SEP_MASK = 2031616         -- Separator mask
ENC_STR_TIME_MASK = 2031616    -- String time mask

--- Time encoding constants
ENC_TIME_SECS_NSECS = 0        -- Seconds and nanoseconds
ENC_TIME_NTP = 2               -- NTP timestamp
ENC_TIME_TOD = 4               -- Time of day
ENC_TIME_RTPS = 8              -- RTPS timestamp
ENC_TIME_NTP_BASE_ZERO = 8     -- NTP timestamp with base zero
ENC_TIME_SECS_USECS = 16       -- Seconds and microseconds
ENC_TIME_TIMEVAL = 16          -- timeval structure
ENC_TIME_TIMESPEC = 0          -- timespec structure
ENC_TIME_SECS = 18             -- Seconds only
ENC_TIME_MSECS = 20            -- Milliseconds
ENC_TIME_SECS_NTP = 24         -- Seconds in NTP format
ENC_TIME_RFC_3971 = 32         -- RFC 3971 timestamp
ENC_TIME_MSEC_NTP = 34         -- Milliseconds in NTP format
ENC_TIME_MIP6 = 36             -- MIPv6 timestamp
ENC_TIME_MP4_FILE_SECS = 38    -- MP4 file seconds
ENC_TIME_CLASSIC_MAC_OS_SECS = 38  -- Classic Mac OS seconds
ENC_TIME_NSECS = 40            -- Nanoseconds
ENC_TIME_USECS = 48            -- Microseconds
ENC_TIME_ZBEE_ZCL = 50         -- ZigBee ZCL timestamp

--- Varint encoding constants
ENC_VARINT_PROTOBUF = 2        -- Protocol Buffers varint
ENC_VARINT_QUIC = 4            -- QUIC varint
ENC_VARINT_ZIGZAG = 8          -- Zigzag varint
ENC_VARINT_SDNV = 16           -- SDNV varint
ENC_VARINT_MASK = 30           -- Varint mask

--- TreeItem represents information in the packet details pane of Wireshark.
--- TreeItems represent nodes in the dissection tree, which can have children.
--- A root TreeItem is passed to dissectors as the third argument (e.g., myproto.dissector(tvbuf, pktinfo, root)).
---@class TreeItem
TreeItem = {}

--- Adds a new child tree for the given ProtoField object to this tree item.
--- Unlike add() and add_le(), the ProtoField argument is not optional and cannot be a Proto object.
--- This function performs both big-endian and little-endian decoding via the encoding argument.
--- Returns the new child TreeItem, the field's extracted value (or nil), and offset (or nil).
---@param protofield ProtoField The ProtoField field object to add to the tree
---@param tvbrange? TvbRange The TvbRange of bytes in the packet this tree item covers
---@param encoding number The field's encoding in the TvbRange (e.g., ENC_BIG_ENDIAN or ENC_LITTLE_ENDIAN)
---@param label? string One or more strings to append to the created TreeItem
---@return TreeItem # The new child TreeItem
---@return any # The field's extracted value or nil
---@return number|nil # Offset where data should be read next, or nil
function TreeItem:add_packet_field(protofield, tvbrange, encoding, label) end

--- Adds a child item to this tree item, returning the new child TreeItem.
--- If the ProtoField represents a numeric value (int, uint or float), it's treated as Big Endian.
---@param protofield ProtoField The ProtoField field to add
---@param tvbrange TvbRange The TvbRange of bytes in the packet this tree item covers
---@param value? number|Int64|UInt64|NSTime The field's value - if supplied will override the value extracted from the TvbRange
---@return TreeItem # The new child TreeItem
function TreeItem:add(protofield, tvbrange, value) end

--- Adds a child item to this tree item, returning the new child TreeItem.
---@param protofield ProtoField The ProtoField field to add
---@param value number|Int64|UInt64|NSTime The field's value
---@return TreeItem # The new child TreeItem
function TreeItem:add(protofield, value) end

--- Adds a child item to this tree item, returning the new child TreeItem.
---@param proto Proto The ProtoField field or Proto protocol object to add
---@param tvbrange TvbRange The TvbRange of bytes in the packet this tree item covers
---@param label? string One or more strings to use for the tree item label
---@return TreeItem # The new child TreeItem
function TreeItem:add(proto, tvbrange, label) end

---Add a child item to this tree item, consisting of all parameter values separated by spaces
---@param label string|number String or number to add as a child item
---@return TreeItem # The new child TreeItem
function TreeItem:add(label) end

--- Adds a child item to this tree item, returning the new child TreeItem.
--- If the ProtoField represents a numeric value (int, uint or float), it's treated as Little Endian.
---@param protofield ProtoField The ProtoField field to add
---@param tvbrange TvbRange The TvbRange of bytes in the packet this tree item covers
---@param value? number|Int64|UInt64|NSTime The field's value - if supplied will override the value extracted from the TvbRange
---@return TreeItem # The new child TreeItem
function TreeItem:add_le(protofield, tvbrange, value) end

--- Adds a child item to this tree item, returning the new child TreeItem.
---@param protofield ProtoField The ProtoField field to add
---@param value number|Int64|UInt64|NSTime The field's value
---@return TreeItem # The new child TreeItem
function TreeItem:add_le(protofield, value) end

--- Adds a child item to this tree item, returning the new child TreeItem.
---@param proto Proto The ProtoField field or Proto protocol object to add
---@param tvbrange TvbRange The TvbRange of bytes in the packet this tree item covers
---@param label? string One or more strings to use for the tree item label
---@return TreeItem # The new child TreeItem
function TreeItem:add_le(proto, tvbrange, label) end

---Add a child item to this tree item, consisting of all parameter values separated by spaces
---If the label field represents a numeric value (int, uint or float), it's treated as Little Endian.
---@param label string|number String or number to add as a child item
---@return TreeItem # The new child TreeItem
function TreeItem:add_le(label) end

--- Sets the text of the label.
--- As of 1.11.3, returns the same tree item to allow chained calls.
---@param text string The text to be used
---@return TreeItem # The same TreeItem
function TreeItem:set_text(text) end

--- Appends text to the label.
--- As of 1.11.3, returns the same tree item to allow chained calls.
---@param text string The text to be appended
---@return TreeItem # The same TreeItem
function TreeItem:append_text(text) end

--- Prepends text to the label.
--- As of 1.11.3, returns the same tree item to allow chained calls.
---@param text string The text to be prepended
---@return TreeItem # The same TreeItem
function TreeItem:prepend_text(text) end

--- Sets the expert flags of the item and adds expert info to the packet.
--- **DEPRECATED**: This function is for backwards compatibility only. Use add_proto_expert_info() instead.
--- This function does not create a truly filterable expert info for a protocol.
---@param group? number One of PI_CHECKSUM, PI_SEQUENCE, PI_RESPONSE_CODE, etc. (see expert.group)
---@param severity? number One of PI_COMMENT, PI_CHAT, PI_NOTE, PI_WARN, or PI_ERROR (see expert.severity)
---@param text? string The text for the expert info display
---@return TreeItem # The same TreeItem
---@deprecated Use add_proto_expert_info() instead
function TreeItem:add_expert_info(group, severity, text) end

--- Sets the expert flags of the tree item and adds expert info to the packet.
--- This is the recommended way to add expert info.
---@param expert ProtoExpert The ProtoExpert object to add to the tree
---@param text? string Text for the expert info display (default is to use the registered text)
---@return TreeItem # The same TreeItem
function TreeItem:add_proto_expert_info(expert, text) end

--- Sets the expert flags of the tree item and adds expert info to the packet
--- associated with the Tvb or TvbRange bytes in the packet.
---@param expert ProtoExpert The ProtoExpert object to add to the tree
---@param tvb Tvb|TvbRange The Tvb or TvbRange object bytes to associate the expert info with
---@param text? string Text for the expert info display (default is to use the registered text)
---@return TreeItem # The same TreeItem
function TreeItem:add_tvb_expert_info(expert, tvb, text) end

--- Marks the TreeItem as a generated field (with data inferred but not contained in the packet).
--- As of 1.11.3, returns the same tree item to allow chained calls.
---@param bool? boolean If true, sets the TreeItem generated flag, else clears it (default=true)
---@return TreeItem # The same TreeItem
function TreeItem:set_generated(bool) end

--- Marks the TreeItem as a hidden field (neither displayed nor used in filters).
--- **DEPRECATED**: This function is deprecated.
--- As of 1.11.3, returns the same tree item to allow chained calls.
---@param bool? boolean If true, sets the TreeItem hidden flag, else clears it (default=true)
---@return TreeItem # The same TreeItem
---@deprecated
function TreeItem:set_hidden(bool) end

--- Set TreeItem's length inside tvb, after it has already been created.
--- As of 1.11.3, returns the same tree item to allow chained calls.
---@param len number The length to be used
---@return TreeItem # The same TreeItem
function TreeItem:set_len(len) end

--- Checks if a ProtoField or Dissector is referenced by a filter/tap/UI.
--- If this returns false, the field does not need to be dissected and can be safely skipped for performance.
--- This function always returns true when the TreeItem is visible.
--- Use in conjunction with the TreeItem.visible attribute for optimization.
---@param protofield ProtoField|Dissector The ProtoField or Dissector to check if referenced
---@return boolean # True if the ProtoField/Dissector is referenced
function TreeItem:referenced(protofield) end

--- Returns string debug information about the TreeItem.
---@return string # Debug information about the TreeItem
function TreeItem:__tostring() end

--- Set/get the TreeItem's display string.
--- For the getter, if the TreeItem has no display string, then nil is returned.
---@type string|nil
TreeItem.text = nil

--- Get the TreeItem's subtree visibility status.
--- If false, the tree is not truly added to (for performance), but add functions can still be called.
---@type boolean
TreeItem.visible = nil

--- Set/get the TreeItem's generated state.
--- Generated fields contain data inferred but not contained in the packet.
---@type boolean
TreeItem.generated = nil

--- Set/get TreeItem's hidden state.
--- Hidden fields are neither displayed nor used in filters.
---@type boolean
TreeItem.hidden = nil

--- Set/get TreeItem's length inside tvb, after it has already been created.
---@type number
TreeItem.len = nil

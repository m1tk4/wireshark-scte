-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_PCRE2.html
-- https://rrthomas.github.io/lrexlib/manual.html

---@class rex_pcre2_regex
---Compiled regular expression object for PCRE2
local rex_pcre2_regex = {}

---Searches for the first match of the compiled regexp in the subject string.
---@param subj string Subject string to search in.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return number|nil start_pos The start point of the match, or nil on failure.
---@return number|nil end_pos The end point of the match, or nil on failure.
---@return table|nil captures Table of captures with false for non-participating subpatterns, or nil on failure.
function rex_pcre2_regex:tfind(subj, init, ef) end

---Searches for the first match and returns offsets instead of substrings.
---@param subj string Subject string to search in.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return number|nil start_pos The start point of the match, or nil on failure.
---@return number|nil end_pos The end point of the match, or nil on failure.
---@return table|nil offsets Table of capture offsets with false for non-participating subpatterns, or nil on failure.
function rex_pcre2_regex:exec(subj, init, ef) end

---Searches for the first match and returns the matched substrings.
---@param subj string Subject string to search in.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return string|nil ... Captured substrings (or whole match if no captures), or nil on failure.
function rex_pcre2_regex:match(subj, init, ef) end

---Searches for the first match and returns position and captures.
---@param subj string Subject string to search in.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return number|nil start_pos The start point of the match, or nil on failure.
---@return number|nil end_pos The end point of the match, or nil on failure.
---@return string|nil ... Captured substrings, or nil on failure.
function rex_pcre2_regex:find(subj, init, ef) end

---Returns a table containing information about the compiled pattern.
---Keys are formed by omitting PCRE2_INFO_ prefix (e.g., "CAPTURECOUNT").
---@return table info Table with pattern information.
function rex_pcre2_regex:patterninfo() return {} end

---Matches using a DFA matching algorithm.
---@param subj string Subject string to search in.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@param ovecsize? number Size of the array for result offsets. Default is 100.
---@param wscount? number Number of elements in the working space array. Default is 50.
---@return number|nil start_pos The start point of matches found, or nil on failure.
---@return table|nil end_positions Table of end points (longer matches first), or nil on failure.
---@return number|nil return_code The return value of pcre2_dfa_exec, or nil on failure.
function rex_pcre2_regex:dfa_exec(subj, init, ef, ovecsize, wscount) end

---JIT compiles the pattern for faster execution.
---@param options? number JIT compilation options (bitwise OR). Default is PCRE2_JIT_COMPLETE.
---@return boolean success True on success.
---@return string|nil error Error message on failure.
function rex_pcre2_regex:jit_compile(options) return true end

---@class rex_pcre2
---PCRE2 regular expression library (Lrexlib)
rex_pcre2 = {}

---Compiles a regular expression pattern.
---@param patt string Regular expression pattern.
---@param cf? number|string Compilation flags (bitwise OR) or string of flag characters (i,m,s,x,U). Default is 0.
---@param lo? string|userdata Locale string (e.g., "French_France.1252") or userdata from maketables(). Default is built-in PCRE2 tables.
---@return rex_pcre2_regex regex Compiled regular expression object.
function rex_pcre2.new(patt, cf, lo) return rex_pcre2_regex() end


---Searches for the first match of pattern in subject.
---@param subj string Subject string to search in.
---@param patt string|rex_pcre2_regex Regular expression pattern or compiled regex.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param cf? number|string Compilation flags (bitwise OR) or string. Default is 0.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return string|nil ... Captured substrings (or whole match if no captures), or nil on failure.
function rex_pcre2.match(subj, patt, init, cf, ef) end

---Searches for the first match and returns position and captures.
---@param subj string Subject string to search in.
---@param patt string|rex_pcre2_regex Regular expression pattern or compiled regex.
---@param init? number Start offset in the subject (can be negative). Default is 1.
---@param cf? number|string Compilation flags (bitwise OR) or string. Default is 0.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return number|nil start_pos The start point of the match, or nil on failure.
---@return number|nil end_pos The end point of the match, or nil on failure.
---@return string|nil ... Captured substrings, or nil on failure.
function rex_pcre2.find(subj, patt, init, cf, ef) end

---Returns an iterator for repeated matching of pattern in subject.
---@param subj string Subject string to search in.
---@param patt string|rex_pcre2_regex Regular expression pattern or compiled regex.
---@param cf? number|string Compilation flags (bitwise OR) or string. Default is 0.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return function iterator Iterator function returning captures on each iteration.
function rex_pcre2.gmatch(subj, patt, cf, ef) return function() return {} end end

---Replaces all matches of pattern in subject.
---@param subj string Subject string.
---@param patt string|rex_pcre2_regex Regular expression pattern or compiled regex.
---@param repl string|function|table Replacement string, function, or table.
---@param n? number|function Maximum number of matches to replace, or control function. Default is unlimited.
---@param cf? number|string Compilation flags (bitwise OR) or string. Default is 0.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return string result The subject string with substitutions made.
---@return number num_matches Number of matches found.
---@return number num_substitutions Number of substitutions made.
function rex_pcre2.gsub(subj, patt, repl, n, cf, ef) return "",0,0 end

---Returns an iterator for splitting subject by separator pattern.
---@param subj string Subject string to split.
---@param sep string|rex_pcre2_regex Separator pattern or compiled regex.
---@param cf? number|string Compilation flags (bitwise OR) or string. Default is 0.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return function iterator Iterator function returning subject sections and captures.
function rex_pcre2.split(subj, sep, cf, ef) return function() return {} end end

---Counts the number of matches of pattern in subject.
---@param subj string Subject string.
---@param patt string|rex_pcre2_regex Regular expression pattern or compiled regex.
---@param cf? number|string Compilation flags (bitwise OR) or string. Default is 0.
---@param ef? number Execution flags (bitwise OR). Default is 0.
---@return number count Number of matches found.
function rex_pcre2.count(subj, patt, cf, ef) return 0 end

---Returns a table of PCRE2 constants (flags).
---Keys are constant names with PCRE2_ prefix omitted (e.g., "CASELESS" for PCRE2_CASELESS).
---@param tb? table Optional table to fill with results. Default creates new table.
---@return table flags Table of constant names to values.
function rex_pcre2.flags(tb) return {} end

---@class userdata
userdata = {}

---Creates character tables for the current locale.
---@return userdata tables Character tables userdata for use with new().
function rex_pcre2.maketables() return userdata() end

---Returns PCRE2 library configuration parameters.
---Keys are formed by omitting PCRE2_CONFIG_ prefix.
---@param tb? table Optional table to fill with results. Default creates new table.
---@return table config Table of configuration parameter names to values.
function rex_pcre2.config(tb) return {} end

---Returns the PCRE2 library version string.
---@return string version The PCRE2 library version and release date.
function rex_pcre2.version() return "" end

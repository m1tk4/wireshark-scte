
## Documentation Sources

These type definitions are based on the official Wireshark documentation:
- [Wireshark Developer's Guide - Lua Support](https://www.wireshark.org/docs/wsdg_html_chunked/)
- [Wireshark Source Code](https://github.com/wireshark/wireshark)
- [Lrexlib Manual](https://rrthomas.github.io/lrexlib/manual.html) - for rex_pcre2 regular expressions
- [Wireshark Globals](https://github.com/wireshark/wireshark/blob/4988cfd31b29704411a7bd341a3034a989996943/test/lua/globals_5.0.txt#L1626)


## TODO
- FieldInfo is still wonky
- Parser doesn't seem to understand object._call() semantics used in TvbRange - i.e. when we do buffer(x,y) and use it as a range.
 
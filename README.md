# wireshark-scte
Collection of WireShark dissectors for several SCTE protocols like SCTE-104, SCTE-35 etc.

### Installs

via releases

```powershell
# Download specific version
Invoke-WebRequest -Uri "https://github.com/m1tk4/wireshark-scte/releases/download/v1.0.0/scte104.lua" -OutFile "scte104.lua"

# Download latest version (always gets newest)
Invoke-WebRequest -Uri "https://github.com/m1tk4/wireshark-scte/releases/latest/download/scte104.lua" -OutFile "scte104.lua"

# Short and makes sure directory is there
mkdir C:\some\path -Force
iwr https://example.com/file.lua -OutFile C:\some\path\file.lua

```

directly from git

```powershell
# Direct download
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/username/repo/main/scte104.lua" -OutFile "scte104.lua"

# Or using curl alias
curl -o scte104.lua https://raw.githubusercontent.com/username/repo/main/scte104.lua
```

checking for dir presence first
```powershell
# install.ps1
$pluginDir = "$env:APPDATA\Wireshark\plugins"
if (!(Test-Path $pluginDir)) { New-Item -ItemType Directory -Path $pluginDir -Force }
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/m1tk4/wireshark-scte/main/scte104.lua" -OutFile "$pluginDir\scte104.lua"
Write-Host "✓ SCTE-104 dissector installed to $pluginDir"
```

### Notes
Some day this will be an actual manual file.

dissector dev:
On a Mac, ensure Wireshark and TShark are available in the path. Otherwise works fine.
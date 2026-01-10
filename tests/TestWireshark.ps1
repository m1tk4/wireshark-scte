#!/usr/bin/env pwsh

# Test SCTE-104 Wireshark dissector with Wireshark GUI
# Usage:
#   .\TestWireshark.ps1                                    # Open with default capture
#   .\TestWireshark.ps1 -CaptureFile "myfile.pcap"         # Open with specific capture

param(
    [string]$CaptureFile = "scte104-init-alive.pcap"
)

$wiresharkPath = 'C:\Program Files\Wireshark\Wireshark.exe'
$projectRoot = Split-Path $PSScriptRoot -Parent

# Get all .lua files from project root
$luaFiles = Get-ChildItem -Path $projectRoot -Filter "*.lua" -File
$luaScriptArgs = @()
foreach ($file in $luaFiles) {
    $luaScriptArgs += "-X"
    $luaScriptArgs += "lua_script:$($file.FullName)"
}

# If CaptureFile is just a filename (not a path), look in captures subfolder
if (-not (Split-Path $CaptureFile)) {
    $captureFile = Join-Path $PSScriptRoot "captures\$CaptureFile"
} else {
    $captureFile = $CaptureFile
}

# Start Wireshark with the Lua scripts and capture file
& $wiresharkPath @luaScriptArgs -r $captureFile

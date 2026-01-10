#!/usr/bin/env pwsh

# Test SCTE-104 Wireshark dissector with tshark
# Usage:
#   .\TestTShark.ps1                                    # Run once with default capture
#   .\TestTShark.ps1 -CaptureFile "myfile.pcap"         # Run with specific capture
#   .\TestTShark.ps1 -Frame 8                           # Show only frame 8
#   .\TestTShark.ps1 -Watch                             # Watch for changes and auto-run
#   .\TestTShark.ps1 -Watch -CaptureFile "myfile.pcap"  # Watch with specific capture
#   .\TestTShark.ps1 -Watch -Frame 8                    # Watch and show only frame 8

param(
    [switch]$Watch,
    [string]$CaptureFile = "scte104-init-alive.pcap",
    [int]$Frame = 0
)

$tsharkPath = 'C:\Program Files\Wireshark\tshark.exe'
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

function Invoke-LuaDissectorTest {
    $filter = 'tcp.len > 0'
    if ($Frame -gt 0) {
        $filter += " and frame.number == $Frame"
    }
    & $tsharkPath @luaScriptArgs -r $captureFile -Y $filter
    Write-Host ("-" * ($Host.UI.RawUI.WindowSize.Width-1)) -ForegroundColor DarkGray
    & $tsharkPath @luaScriptArgs -r $captureFile -Y $filter -O scte104 -P | Select-Object -Skip 5
}

if ($Watch) {
    $watchPath = Split-Path $PSScriptRoot -Parent

    Clear-Host
    Write-Host "Running test with $(Split-Path $captureFile -Leaf)..." -ForegroundColor DarkGray
    Invoke-LuaDissectorTest

    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $watchPath
    $watcher.Filter = "*.lua"
    $watcher.IncludeSubdirectories = $false
    $watcher.EnableRaisingEvents = $true

    Register-ObjectEvent $watcher "Changed" -SourceIdentifier "LuaFileChanged" | Out-Null

    Write-Host "`nWatching for .lua file changes... (Press Ctrl+C to stop)" -ForegroundColor Green

    $lastRun = [DateTime]::MinValue

    try {
        while ($true) {
            $result = Wait-Event -Timeout 1
            if ($result) {
                $file = $result.SourceEventArgs.Name
                Remove-Event -EventIdentifier $result.EventIdentifier
                
                # Debounce: ignore if last run was less than 1 second ago
                $now = Get-Date
                if (($now - $lastRun).TotalSeconds -lt 1) {
                    continue
                }
                $lastRun = $now
                
                Clear-Host
                Write-Host "[$(Get-Date -Format 'HH:mm:ss')] File changed: $file, running test with $(Split-Path $captureFile -Leaf)..." -ForegroundColor DarkGray
                Invoke-LuaDissectorTest
            }
        }
    } finally {
        Unregister-Event -SourceIdentifier "LuaFileChanged" -ErrorAction SilentlyContinue
        $watcher.Dispose()
    }
} else {
    Invoke-LuaDissectorTest
}

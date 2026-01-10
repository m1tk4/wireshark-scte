#!/usr/bin/env node

import { spawn } from "child_process";
import fs from "fs";
import path from "path";

// Find Wireshark executable based on platform
function getWiresharkPath() {
  let wiresharkPath;
  
  switch (process.platform) {
    case "win32":
      wiresharkPath = "C:\\Program Files\\Wireshark\\Wireshark.exe";
      if (fs.existsSync(wiresharkPath)) {
        return wiresharkPath;
      }
      // Fallback to PATH
      return "wireshark";
      
    case "darwin":
      // macOS - check common installation paths
      const macPaths = [
        "/Applications/Wireshark.app/Contents/MacOS/Wireshark",
        "/usr/local/bin/wireshark"
      ];
      for (const p of macPaths) {
        if (fs.existsSync(p)) {
          return p;
        }
      }
      return "wireshark";
      
    default:
      // Linux and others - assume in PATH
      return "wireshark";
  }
}

// Get all .lua files from project root
const projectRoot = path.resolve(".");
const luaFiles = fs.readdirSync(projectRoot)
  .filter(f => f.endsWith(".lua"))
  .map(f => path.join(projectRoot, f));

if (luaFiles.length === 0) {
  console.error("No .lua files found in project root");
  process.exit(1);
}

// Build arguments
const args = [];

// Add lua script arguments
for (const luaFile of luaFiles) {
  args.push("-X", `lua_script:${luaFile}`);
}

// Add any additional arguments passed to this script
const additionalArgs = process.argv.slice(2);
args.push(...additionalArgs);

const wiresharkPath = getWiresharkPath();

console.log(`Starting Wireshark...`);
console.log(`Loaded ${luaFiles.length} dissector(s):`);
luaFiles.forEach(f => console.log(`  - ${path.basename(f)}`));
console.log();

// Spawn Wireshark
const wireshark = spawn(wiresharkPath, args, {
  stdio: "inherit",
  detached: false
});

wireshark.on("error", (err) => {
  console.error(`Failed to start Wireshark: ${err.message}`);
  console.error(`Tried to run: ${wiresharkPath}`);
  process.exit(1);
});

wireshark.on("exit", (code) => {
  process.exit(code || 0);
});

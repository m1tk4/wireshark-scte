import { execFile } from "child_process";
import path from "path";
import fs from "fs";

// Find tshark executable
function getTsharkPath() {
  // Default to 'tshark' (assumes it's in PATH)
  let tsharkPath = "tshark";
  
  // On Windows, check common installation path if tshark is not in PATH
  if (process.platform === "win32") {
    const commonPath = "C:\\Program Files\\Wireshark\\tshark.exe";
    if (fs.existsSync(commonPath)) {
      tsharkPath = commonPath;
    }
  }
  
  return tsharkPath;
}

export function runTshark({ pcap, lua }) {
  return new Promise((resolve, reject) => {
    // Extract protocol name from lua filename (e.g., "scte104.lua" -> "scte104")
    const protocolName = path.basename(lua, ".lua");
    
    const args = [
      "-r", pcap,
      "-X", `lua_script:${lua}`,
      "-O", protocolName,
      '-P',
      "-V"
    ];

    const tsharkPath = getTsharkPath();

    execFile(tsharkPath, args, { maxBuffer: 50_000_000 }, (err, stdout, stderr) => {
      if (err) {
        reject(new Error(`tshark failed: ${stderr || err.message}`));
      } else {
        resolve(stdout);
      }
    });
  });
}
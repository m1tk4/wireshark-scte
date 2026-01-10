#!/usr/bin/env node

import fs from "fs";
import path from "path";
import { runTshark } from "./helpers/runTShark.js";

const sampleName = process.argv[2];

if (!sampleName) {
  console.error("Usage: npm run watch-sample <sample-name>");
  console.error("Example: npm run watch-sample scte104-init_request");
  process.exit(1);
}

const samplesDir = path.resolve("tests/samples");
const pcapFile = sampleName.endsWith(".pcap") ? sampleName : `${sampleName}.pcap`;
const pcapPath = path.join(samplesDir, pcapFile);

if (!fs.existsSync(pcapPath)) {
  console.error(`Error: Sample file not found: ${pcapPath}`);
  process.exit(1);
}

// Extract dissector name from first chunk of filename (before first "-")
const dissectorName = pcapFile.split("-")[0];
const luaDissector = path.resolve(`${dissectorName}.lua`);

if (!fs.existsSync(luaDissector)) {
  console.error(`Error: Dissector not found: ${luaDissector}`);
  process.exit(1);
}

async function runTest() {
  console.clear();
  console.log(`${pcapFile} >> ${dissectorName}.lua`);
  console.log("-".repeat(80));
  console.log();
  
  try {
    const output = await runTshark({
      pcap: pcapPath,
      lua: luaDissector
    });
    
    console.log(output);
  } catch (error) {
    console.error(`Error: ${error.message}`);
  }
}

// Initial run
await runTest();

// Watch for .lua file changes
const projectRoot = path.resolve(".");
console.log();
console.log("=".repeat(80));
console.log("Watching for .lua file changes... (Press Ctrl+C to stop)");

let debounceTimer;
let isRunning = false;
const fileModTimes = new Map();

fs.watch(projectRoot, { recursive: false }, (eventType, filename) => {
  if (filename && filename.endsWith(".lua")) {
    clearTimeout(debounceTimer);
    
    debounceTimer = setTimeout(() => {
      // Don't trigger if already running
      if (isRunning) return;
      
      // Check if file actually changed
      const filePath = path.join(projectRoot, filename);
      try {
        const stats = fs.statSync(filePath);
        const modTime = stats.mtimeMs;
        const lastModTime = fileModTimes.get(filename);
        
        // Skip if file hasn't changed since last check
        if (lastModTime === modTime) return;
        
        fileModTimes.set(filename, modTime);
        
        isRunning = true;
        const timestamp = new Date().toLocaleTimeString();
        console.log(`\n[${timestamp}] File changed: ${filename}`);
        runTest().finally(() => {
          isRunning = false;
        });
      } catch (err) {
        // File might have been deleted or is temporarily inaccessible
      }
    }, 500);
  }
});

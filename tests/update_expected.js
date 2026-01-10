#!/usr/bin/env node

import fs from "fs";
import path from "path";
import { runTshark } from "./helpers/runTShark.js";

const samplesDir = path.resolve("tests/samples");
const fileMask = process.argv[2];

// Simple glob matching (supports * wildcard)
function matchesMask(filename, mask) {
  if (!mask) return true; // No mask means match all
  
  // Convert glob pattern to regex
  const regexPattern = mask
    .replace(/[.+?^${}()|[\]\\]/g, '\\$&') // Escape special regex chars
    .replace(/\*/g, '.*'); // Convert * to .*
  
  const regex = new RegExp(`^${regexPattern}$`, 'i');
  return regex.test(filename);
}

async function updateExpectedFiles() {
  let allPcaps = fs.readdirSync(samplesDir).filter(f => f.endsWith(".pcap"));
  
  // Filter by mask if provided
  if (fileMask) {
    allPcaps = allPcaps.filter(pcap => matchesMask(pcap, fileMask));
    console.log(`Filter: ${fileMask}`);
  }
  
  if (allPcaps.length === 0) {
    console.log("No matching .pcap files found");
    process.exit(0);
  }
  
  console.log(`Found ${allPcaps.length} .pcap file(s) to process\n`);
  
  for (const pcap of allPcaps) {
    try {
      const expectedFile = pcap.replace(".pcap", ".expected");
      const expectedPath = path.join(samplesDir, expectedFile);
      
      // Skip if .expected file already exists
      if (fs.existsSync(expectedPath)) {
        console.log(`Skipping ${pcap} (${expectedFile} already exists)\n`);
        continue;
      }
      
      // Extract dissector name from first chunk of filename (before first "-")
      const dissectorName = pcap.split("-")[0];
      const luaDissector = path.resolve(`${dissectorName}.lua`);
      
      console.log(`Processing ${pcap}...`);
      console.log(`  Using dissector: ${dissectorName}.lua`);
      
      const output = await runTshark({
        pcap: path.join(samplesDir, pcap),
        lua: luaDissector
      });
      
      fs.writeFileSync(expectedPath, output, "utf8");
      console.log(`  ✓ Updated ${expectedFile}\n`);
      
    } catch (error) {
      console.error(`  ✗ Error processing ${pcap}: ${error.message}\n`);
    }
  }
  
  console.log("Done!");
}

updateExpectedFiles().catch(err => {
  console.error("Fatal error:", err);
  process.exit(1);
});

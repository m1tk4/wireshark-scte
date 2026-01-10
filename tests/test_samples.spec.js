import fs from "fs";
import path from "path";
import { runTshark } from "./helpers/runTShark.js";
import { compareOutput } from "./helpers/compare.js";

const samplesDir = path.resolve("tests/samples");

describe("Wireshark Dissector Test Suite", function () {
  this.timeout(10000);

  const pcaps = fs.readdirSync(samplesDir).filter(f => f.endsWith(".pcap"));

  for (const pcap of pcaps) {
    const name = pcap.replace(".pcap", ".expected");
    const expectedPath = path.join(samplesDir, name);
    
    // Extract dissector name from first chunk of filename (before first "-")
    const dissectorName = pcap.split("-")[0];
    const luaDissector = path.resolve(`${dissectorName}.lua`);

    it(`parses ${pcap}`, async () => {
      const actual = await runTshark({
        pcap: path.join(samplesDir, pcap),
        lua: luaDissector
      });

      const expected = fs.readFileSync(expectedPath, "utf8");
      compareOutput(actual, expected);
    });
  }
});
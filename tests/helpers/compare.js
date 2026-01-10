import { diffLines } from "diff";
import { expect } from "chai";

export function compareOutput(actual, expected) {
  if (actual === expected) return;

  const diff = diffLines(expected, actual)
    .map(part => {
      const sign = part.added ? "+" : part.removed ? "-" : " ";
      return sign + part.value;
    })
    .join("");

  expect(actual, "tshark output mismatch:\n" + diff).to.equal(expected);
}
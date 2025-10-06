candidate: same_chars;

check:{[candidate]
    .qython.assert[candidate["eabcdzzzz";"dddzzzzzzzddeddabc"] = 1b];
    .qython.assert[candidate["abcd";"dddddddabc"] = 1b];
    .qython.assert[candidate["dddddddabc";"abcd"] = 1b];
    .qython.assert[candidate["eabcd";"dddddddabc"] = 0b];
    .qython.assert[candidate["abcd";"dddddddabcf"] = 0b];
    .qython.assert[candidate["eabcdzzzz";"dddzzzzzzzddddabc"] = 0b];
    .qython.assert[candidate["aabb";"aaccc"] = 0b]
    }
candidate: remove_vowels;

check:{[candidate]
    .qython.assert[candidate[""] = ""];
    .qython.assert[candidate["abcdef\nghijklm"] = "bcdf\nghjklm"];
    .qython.assert[candidate["fedcba"] = "fdcb"];
    .qython.assert[candidate["eeeee"] = ""];
    .qython.assert[candidate["acBAA"] = "cB"];
    .qython.assert[candidate["EcBOO"] = "cB"];
    .qython.assert[candidate["ybcd"] = "ybcd"]
    }
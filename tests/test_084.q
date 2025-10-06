candidate: solve;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1000] = enlist["1"];"Error"];
    .qython.assert2[candidate[150] = "110";"Error"];
    .qython.assert2[candidate[147] = "1100";"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[333] = "1001";"Error"];
    .qython.assert2[candidate[963] = "10010";"Error"]
    }
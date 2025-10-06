candidate: starts_one_ends;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[1] = 1];
    .qython.assert[candidate[2] = 18];
    .qython.assert[candidate[3] = 180];
    .qython.assert[candidate[4] = 1800];
    .qython.assert[candidate[5] = 18000];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
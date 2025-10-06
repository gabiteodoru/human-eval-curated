candidate: get_odd_collatz;

check:{[candidate]
    .qython.assert[candidate[14] = (1;5;7;11;13;17)];
    .qython.assert[candidate[5] = (1;5)];
    .qython.assert2[candidate[12] = (1;3;5);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1] = enlist 1;"This prints if this assert fails 2 (also good for debugging!)"]
    }
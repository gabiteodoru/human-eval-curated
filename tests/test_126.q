candidate: is_sorted;

check:{[candidate]
    .qython.assert[(candidate[enlist 5]) = 1b];
    .qython.assert[candidate[(1;2;3;4;5)] = 1b];
    .qython.assert[candidate[(1;3;2;4;5)] = 0b];
    .qython.assert[candidate[(1;2;3;4;5;6)] = 1b];
    .qython.assert[candidate[(1;2;3;4;5;6;7)] = 1b];
    .qython.assert2[candidate[(1;3;2;4;5;6;7)] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[()] = 1b;"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[(candidate[enlist 1]) = 1b;"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[(3;2;1)] = 0b;"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;2;2;3;4)] = 0b;"This prints if this assert fails 5 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;3;3;4)] = 0b;"This prints if this assert fails 6 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;2;3;3;4)] = 1b;"This prints if this assert fails 7 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;4)] = 1b;"This prints if this assert fails 8 (good for debugging!)"]
    }
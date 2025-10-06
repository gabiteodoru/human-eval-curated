candidate: any_int;

check:{[candidate]
    .qython.assert2[candidate[2;3;1] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[2.5;2;3] = 0b;"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate[1.5;5;3.5] = 0b;"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[2;6;2] = 0b;"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[candidate[4;2;2] = 1b;"This prints if this assert fails 5 (good for debugging!)"];
    .qython.assert2[candidate[2.2;2.2;2.2] = 0b;"This prints if this assert fails 6 (good for debugging!)"];
    .qython.assert2[candidate[-4;6;2] = 1b;"This prints if this assert fails 7 (good for debugging!)"];
    .qython.assert2[candidate[2;1;1] = 1b;"This prints if this assert fails 8 (also good for debugging!)"];
    .qython.assert2[candidate[3;4;7] = 1b;"This prints if this assert fails 9 (also good for debugging!)"];
    .qython.assert2[candidate[3.0;4;7] = 0b;"This prints if this assert fails 10 (also good for debugging!)"]
    }
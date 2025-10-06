candidate: is_simple_power;

check:{[candidate]
    .qython.assert2[candidate[16;2] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[143214;16] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[4;2] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[9;3] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[16;4] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[24;2] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[128;4] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[12;6] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1;1] = 1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[1;12] = 1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
candidate: decimal_to_binary;

check:{[candidate]
    .qython.assert[candidate[0] = "db0db"];
    .qython.assert[candidate[32] = "db100000db"];
    .qython.assert[candidate[103] = "db1100111db"];
    .qython.assert2[candidate[15] = "db1111db";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
candidate: circular_shift;

check:{[candidate]
    .qython.assert[candidate[100;2] = "001"];
    .qython.assert[candidate[12;2] = "12"];
    .qython.assert[candidate[97;8] = "79"];
    .qython.assert2[candidate[12;1] = "21";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[11;101] = "11";"This prints if this assert fails 2 (also good for debugging!)"]
    }
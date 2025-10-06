candidate: prod_signs;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(1;2;2;-4)] = -9];
    .qython.assert[candidate[(0;1)] = 0];
    .qython.assert[candidate[(1;1;1;2;3;-1;1)] = -10];
    .qython.assert[candidate[()] = (::)];
    .qython.assert[candidate[(2;4;1;2;-1;-1;9)] = 20];
    .qython.assert[candidate[(-1;1;-1;1)] = 4];
    .qython.assert[candidate[(-1;1;1;1)] = -4];
    .qython.assert[candidate[(-1;1;1;0)] = 0];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
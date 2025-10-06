candidate: triangle_area;

check:{[candidate]
    .qython.assert2[candidate[3;4;5] = 6.00;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[1;2;10] = -1];
    .qython.assert[candidate[4;8;5] = 8.18];
    .qython.assert[candidate[2;2;2] = 1.73];
    .qython.assert[candidate[1;2;3] = -1];
    .qython.assert[candidate[10;5;7] = 16.25];
    .qython.assert[candidate[2;6;3] = -1];
    .qython.assert2[candidate[1;1;1] = 0.43;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[2;2;10] = -1]
    }
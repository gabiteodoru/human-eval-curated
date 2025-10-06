candidate: sort_array;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(1;5;2;3;4)] = (1;2;4;3;5)];
    .qython.assert[candidate[(1;0;2;3;4)] = (0;1;2;4;3)];
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(2;5;77;4;5;3;5;7;2;3;4)] = (2;2;4;4;3;3;5;5;5;7;77)];
    .qython.assert[candidate[(3;6;44;12;32;5)] = (32;3;5;6;12;44)];
    .qython.assert[candidate[(2;4;8;16;32)] = (2;4;8;16;32)];
    .qython.assert[candidate[(2;4;8;16;32)] = (2;4;8;16;32)];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
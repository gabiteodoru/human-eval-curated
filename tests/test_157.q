candidate: right_angle_triangle;

check:{[candidate]
    .qython.assert2[candidate[3;4;5] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[1;2;3] = 0b];
    .qython.assert[candidate[10;6;8] = 1b];
    .qython.assert[candidate[2;2;2] = 0b];
    .qython.assert[candidate[7;24;25] = 1b];
    .qython.assert[candidate[10;5;7] = 0b];
    .qython.assert[candidate[5;12;13] = 1b];
    .qython.assert[candidate[15;8;17] = 1b];
    .qython.assert[candidate[48;55;73] = 1b];
    .qython.assert2[candidate[1;1;1] = 0b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[2;2;10] = 0b]
    }
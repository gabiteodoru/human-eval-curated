candidate: count_nums;

check:{[candidate]
    .qython.assert[candidate[()] = 0];
    .qython.assert[candidate[(-1;-2;0)] = 0];
    .qython.assert[candidate[(1;1;2;-2;3;4;5)] = 6];
    .qython.assert[candidate[(1;6;9;-6;0;1;5)] = 5];
    .qython.assert[candidate[(1;100;98;-7;1;-1)] = 4];
    .qython.assert[candidate[(12;23;34;-45;-56;0)] = 5];
    .qython.assert[(candidate[(-0;1 xexp 0)]) = 1];
    .qython.assert[(candidate[enlist 1]) = 1];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
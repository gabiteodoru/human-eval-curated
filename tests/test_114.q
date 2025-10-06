candidate: minSubArraySum;

check:{[candidate]
    .qython.assert2[candidate[(2;3;4;1;2;4)] = 1;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(-1;-2;-3)] = -6];
    .qython.assert[candidate[(-1;-2;-3;2;-10)] = -14];
    .qython.assert[(candidate[enlist -9999999999999999]) = -9999999999999999];
    .qython.assert[candidate[(0;10;20;1000000)] = 0];
    .qython.assert[candidate[(-1;-2;-3;10;-5)] = -6];
    .qython.assert[candidate[(100;-1;-2;-3;10;-5)] = -6];
    .qython.assert[candidate[(10;11;13;8;3;4)] = 3];
    .qython.assert[candidate[(100;-33;32;-1;0;-2)] = -33];
    .qython.assert2[(candidate[enlist -10]) = -10;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[(candidate[enlist 7]) = 7];
    .qython.assert[candidate[(1;-1)] = -1]
    }
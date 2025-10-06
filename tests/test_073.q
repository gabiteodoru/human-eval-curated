candidate: smallest_change;

check:{[candidate]
    .qython.assert[candidate[(1;2;3;5;4;7;9;6)] = 4];
    .qython.assert[candidate[(1;2;3;4;3;2;2)] = 1];
    .qython.assert[candidate[(1;4;2)] = 1];
    .qython.assert[candidate[(1;4;4;2)] = 1];
    .qython.assert[candidate[(1;2;3;2;1)] = 0];
    .qython.assert[candidate[(3;1;1;3)] = 0];
    .qython.assert[(candidate[enlist 1]) = 0];
    .qython.assert[candidate[(0;1)] = 1]
    }
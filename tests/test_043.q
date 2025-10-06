candidate: pairs_sum_to_zero;

check:{[candidate]
    .qython.assert[candidate[(1;3;5;0)] = 0b];
    .qython.assert[candidate[(1;3;-2;1)] = 0b];
    .qython.assert[candidate[(1;2;3;7)] = 0b];
    .qython.assert[candidate[(2;4;-5;3;5;7)] = 1b];
    .qython.assert[(candidate[enlist 1]) = 0b];
    .qython.assert[candidate[(-3;9;-1;3;2;30)] = 1b];
    .qython.assert[candidate[(-3;9;-1;3;2;31)] = 1b];
    .qython.assert[candidate[(-3;9;-1;4;2;30)] = 0b];
    .qython.assert[candidate[(-3;9;-1;4;2;31)] = 0b]
    }
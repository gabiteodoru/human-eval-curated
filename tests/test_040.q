candidate: triples_sum_to_zero;

check:{[candidate]
    .qython.assert[candidate[(1;3;5;0)] = 0b];
    .qython.assert[candidate[(1;3;5;-1)] = 0b];
    .qython.assert[candidate[(1;3;-2;1)] = 1b];
    .qython.assert[candidate[(1;2;3;7)] = 0b];
    .qython.assert[candidate[(1;2;5;7)] = 0b];
    .qython.assert[candidate[(2;4;-5;3;9;7)] = 1b];
    .qython.assert[(candidate[enlist 1]) = 0b];
    .qython.assert[candidate[(1;3;5;-100)] = 0b];
    .qython.assert[candidate[(100;3;5;-100)] = 0b]
    }
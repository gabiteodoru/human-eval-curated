candidate: below_zero;

check:{[candidate]
    .qython.assert[candidate[()] = 0b];
    .qython.assert[candidate[(1;2;-3;1;2;-3)] = 0b];
    .qython.assert[candidate[(1;2;-4;5;6)] = 1b];
    .qython.assert[candidate[(1;-1;2;-2;5;-5;4;-4)] = 0b];
    .qython.assert[candidate[(1;-1;2;-2;5;-5;4;-5)] = 1b];
    .qython.assert[candidate[(1;-2;2;-2;5;-5;4;-4)] = 1b]
    }
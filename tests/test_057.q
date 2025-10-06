candidate: monotonic;

check:{[candidate]
    .qython.assert[candidate[(1;2;4;10)] = 1b];
    .qython.assert[candidate[(1;2;4;20)] = 1b];
    .qython.assert[candidate[(1;20;4;10)] = 0b];
    .qython.assert[candidate[(4;1;0;-10)] = 1b];
    .qython.assert[candidate[(4;1;1;0)] = 1b];
    .qython.assert[candidate[(1;2;3;2;5;60)] = 0b];
    .qython.assert[candidate[(1;2;3;4;5;60)] = 1b];
    .qython.assert[candidate[(9;9;9;9)] = 1b]
    }
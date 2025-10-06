candidate: can_arrange;

check:{[candidate]
    .qython.assert[candidate[(1;2;4;3;5)] = 3];
    .qython.assert[candidate[(1;2;4;5)] = -1];
    .qython.assert[candidate[(1;4;2;5;6;7;8;9;10)] = 2];
    .qython.assert[candidate[(4;8;5;7;3)] = 4];
    .qython.assert[candidate[()] = -1]
    }
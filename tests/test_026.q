candidate: remove_duplicates;

check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;2;3;4)] = (1;2;3;4)];
    .qython.assert[candidate[(1;2;3;2;4;3;5)] = (1;4;5)]
    }
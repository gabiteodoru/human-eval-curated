candidate: running_max;

check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;2;3;4)] = (1;2;3;4)];
    .qython.assert[candidate[(4;3;2;1)] = (4;4;4;4)];
    .qython.assert[candidate[(3;2;3;100;3)] = (3;3;3;100;100)]
    }
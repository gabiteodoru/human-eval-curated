candidate: derivative;

check:{[candidate]
    .qython.assert[candidate[(3;1;2;4;5)] = (1;4;12;20)];
    .qython.assert[candidate[(1;2;3)] = (2;6)];
    .qython.assert[candidate[(3;2;1)] = (2;2)];
    .qython.assert[candidate[(3;2;1;0;4)] = (2;2;0;16)];
    .qython.assert[(candidate[enlist 1]) = ()]
    }
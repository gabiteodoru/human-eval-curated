candidate: median;

check:{[candidate]
    .qython.assert[candidate[(3;1;2;4;5)] = 3];
    .qython.assert[candidate[(-10;4;6;1000;10;20)] = 8.0];
    .qython.assert[(candidate[enlist 5]) = 5];
    .qython.assert[candidate[(6;5)] = 5.5];
    .qython.assert[candidate[(8;1;3;9;9;2;7)] = 7]
    }
candidate: f;

check:{[candidate]
    .qython.assert[candidate[5] = (1;2;6;24;15)];
    .qython.assert[candidate[7] = (1;2;6;24;15;720;28)];
    .qython.assert[candidate[1] = enlist 1];
    .qython.assert[candidate[3] = (1;2;6)]
    }
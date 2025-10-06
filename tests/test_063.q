candidate: fibfib;

check:{[candidate]
    .qython.assert[candidate[2] = 1];
    .qython.assert[candidate[1] = 0];
    .qython.assert[candidate[5] = 4];
    .qython.assert[candidate[8] = 24];
    .qython.assert[candidate[10] = 81];
    .qython.assert[candidate[12] = 274];
    .qython.assert[candidate[14] = 927]
    }
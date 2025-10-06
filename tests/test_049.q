candidate: modp;

check:{[candidate]
    .qython.assert[candidate[3;5] = 3];
    .qython.assert[candidate[1101;101] = 2];
    .qython.assert[candidate[0;101] = 1];
    .qython.assert[candidate[3;11] = 8];
    .qython.assert[candidate[100;101] = 1];
    .qython.assert[candidate[30;5] = 4];
    .qython.assert[candidate[31;5] = 3]
    }
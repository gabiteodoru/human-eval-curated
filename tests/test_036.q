candidate: fizz_buzz;

check:{[candidate]
    .qython.assert[candidate[50] = 0];
    .qython.assert[candidate[78] = 2];
    .qython.assert[candidate[79] = 3];
    .qython.assert[candidate[100] = 3];
    .qython.assert[candidate[200] = 6];
    .qython.assert[candidate[4000] = 192];
    .qython.assert[candidate[10000] = 639];
    .qython.assert[candidate[100000] = 8026]
    }
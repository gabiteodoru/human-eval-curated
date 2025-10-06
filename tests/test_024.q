candidate: largest_divisor;

check:{[candidate]
    .qython.assert[candidate[3] = 1];
    .qython.assert[candidate[7] = 1];
    .qython.assert[candidate[10] = 5];
    .qython.assert[candidate[100] = 50];
    .qython.assert[candidate[49] = 7]
    }
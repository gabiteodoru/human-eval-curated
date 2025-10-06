candidate: greatest_common_divisor;

check:{[candidate]
    .qython.assert[candidate[3;7] = 1];
    .qython.assert[candidate[10;15] = 5];
    .qython.assert[candidate[49;14] = 7];
    .qython.assert[candidate[144;60] = 12]
    }
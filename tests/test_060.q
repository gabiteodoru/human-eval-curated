candidate: sum_to_n;

check:{[candidate]
    .qython.assert[candidate[1] = 1];
    .qython.assert[candidate[6] = 21];
    .qython.assert[candidate[11] = 66];
    .qython.assert[candidate[30] = 465];
    .qython.assert[candidate[100] = 5050]
    }
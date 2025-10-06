candidate: digits;

check:{[candidate]
    .qython.assert[candidate[5] = 5];
    .qython.assert[candidate[54] = 5];
    .qython.assert[candidate[120] = 1];
    .qython.assert[candidate[5014] = 5];
    .qython.assert[candidate[98765] = 315];
    .qython.assert[candidate[5576543] = 2625];
    .qython.assert[candidate[2468] = 0]
    }
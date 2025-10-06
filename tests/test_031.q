candidate: is_prime;

check:{[candidate]
    .qython.assert[candidate[6] = 0b];
    .qython.assert[candidate[101] = 1b];
    .qython.assert[candidate[11] = 1b];
    .qython.assert[candidate[13441] = 1b];
    .qython.assert[candidate[61] = 1b];
    .qython.assert[candidate[4] = 0b];
    .qython.assert[candidate[1] = 0b];
    .qython.assert[candidate[5] = 1b];
    .qython.assert[candidate[11] = 1b];
    .qython.assert[candidate[17] = 1b];
    .qython.assert[candidate[5*17] = 0b];
    .qython.assert[candidate[11*7] = 0b];
    .qython.assert[candidate[13441*19] = 0b]
    }
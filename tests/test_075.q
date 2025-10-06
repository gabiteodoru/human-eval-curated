candidate: is_multiply_prime;

check:{[candidate]
    .qython.assert[candidate[5] = 0b];
    .qython.assert[candidate[30] = 1b];
    .qython.assert[candidate[8] = 1b];
    .qython.assert[candidate[10] = 0b];
    .qython.assert[candidate[125] = 1b];
    .qython.assert[candidate[(3*5)*7] = 1b];
    .qython.assert[candidate[(3*6)*7] = 0b];
    .qython.assert[candidate[(9*9)*9] = 0b];
    .qython.assert[candidate[(11*9)*9] = 0b];
    .qython.assert[candidate[(11*13)*7] = 1b]
    }
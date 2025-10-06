candidate: largest_prime_factor;

check:{[candidate]
    .qython.assert[candidate[15] = 5];
    .qython.assert[candidate[27] = 3];
    .qython.assert[candidate[63] = 7];
    .qython.assert[candidate[330] = 11];
    .qython.assert[candidate[13195] = 29]
    }
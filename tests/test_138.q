candidate: is_equal_to_sum_even;

check:{[candidate]
    .qython.assert[candidate[4] = 0b];
    .qython.assert[candidate[6] = 0b];
    .qython.assert[candidate[8] = 1b];
    .qython.assert[candidate[10] = 1b];
    .qython.assert[candidate[11] = 0b];
    .qython.assert[candidate[12] = 1b];
    .qython.assert[candidate[13] = 0b];
    .qython.assert[candidate[16] = 1b]
    }
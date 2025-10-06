candidate: fib;

check:{[candidate]
    .qython.assert[candidate[10] = 55];
    .qython.assert[candidate[1] = 1];
    .qython.assert[candidate[8] = 21];
    .qython.assert[candidate[11] = 89];
    .qython.assert[candidate[12] = 144]
    }
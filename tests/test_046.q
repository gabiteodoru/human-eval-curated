candidate: fib4;

check:{[candidate]
    .qython.assert[candidate[5] = 4];
    .qython.assert[candidate[8] = 28];
    .qython.assert[candidate[10] = 104];
    .qython.assert[candidate[12] = 386]
    }
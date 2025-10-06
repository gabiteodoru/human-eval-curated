candidate: prime_fib;

check:{[candidate]
    .qython.assert[candidate[1] = 2];
    .qython.assert[candidate[2] = 3];
    .qython.assert[candidate[3] = 5];
    .qython.assert[candidate[4] = 13];
    .qython.assert[candidate[5] = 89];
    .qython.assert[candidate[6] = 233];
    .qython.assert[candidate[7] = 1597];
    .qython.assert[candidate[8] = 28657];
    .qython.assert[candidate[9] = 514229];
    .qython.assert[candidate[10] = 433494437]
    }
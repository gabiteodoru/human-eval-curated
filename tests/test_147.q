candidate: get_max_triples;

check:{[candidate]
    .qython.assert[candidate[5] = 1];
    .qython.assert[candidate[6] = 4];
    .qython.assert[candidate[10] = 36];
    .qython.assert[candidate[100] = 53361]
    }
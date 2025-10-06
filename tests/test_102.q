candidate: choose_num;

check:{[candidate]
    .qython.assert[candidate[12;15] = 14];
    .qython.assert[candidate[13;12] = -1];
    .qython.assert[candidate[33;12354] = 12354];
    .qython.assert[candidate[5234;5233] = -1];
    .qython.assert[candidate[6;29] = 28];
    .qython.assert[candidate[27;10] = -1];
    .qython.assert[candidate[7;7] = -1];
    .qython.assert[candidate[546;546] = 546]
    }
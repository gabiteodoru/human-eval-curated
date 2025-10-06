candidate: count_up_to;

check:{[candidate]
    .qython.assert[candidate[5] = (2;3)];
    .qython.assert[candidate[6] = (2;3;5)];
    .qython.assert[candidate[7] = (2;3;5)];
    .qython.assert[candidate[10] = (2;3;5;7)];
    .qython.assert[candidate[0] = ()];
    .qython.assert[candidate[22] = (2;3;5;7;11;13;17;19)];
    .qython.assert[candidate[1] = ()];
    .qython.assert[candidate[18] = (2;3;5;7;11;13;17)];
    .qython.assert[candidate[47] = (2;3;5;7;11;13;17;19;23;29;31;37;41;43)];
    .qython.assert[candidate[101] = (2;3;5;7;11;13;17;19;23;29;31;37;41;43;47;53;59;61;67;71;73;79;83;89;97)]
    }
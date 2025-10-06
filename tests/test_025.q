candidate: factorize;

check:{[candidate]
    .qython.assert[candidate[2] = enlist 2];
    .qython.assert[candidate[4] = (2;2)];
    .qython.assert[candidate[8] = (2;2;2)];
    .qython.assert[candidate[3*19] = (3;19)];
    .qython.assert[candidate[((3*19)*3)*19] = (3;3;19;19)];
    .qython.assert[candidate[((((3*19)*3)*19)*3)*19] = (3;3;3;19;19;19)];
    .qython.assert[candidate[((3*19)*19)*19] = (3;19;19;19)];
    .qython.assert[candidate[(3*2)*3] = (2;3;3)]
    }
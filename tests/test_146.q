candidate: specialFilter;

check:{[candidate]
    .qython.assert[candidate[(5;-2;1;-5)] = 0];
    .qython.assert[candidate[(15;-73;14;-15)] = 1];
    .qython.assert[candidate[(33;-2;-3;45;21;109)] = 2];
    .qython.assert[candidate[(43;-12;93;125;121;109)] = 4];
    .qython.assert[candidate[(71;-2;-33;75;21;19)] = 3];
    .qython.assert[(candidate[enlist 1]) = 0];
    .qython.assert[candidate[()] = 0]
    }
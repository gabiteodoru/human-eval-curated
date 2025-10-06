candidate: intersperse;

check:{[candidate]
    .qython.assert[candidate[();7] = ()];
    .qython.assert[candidate[(5;6;3;2);8] = (5;8;6;8;3;8;2)];
    .qython.assert[candidate[(2;2;2);2] = (2;2;2;2;2)]
    }
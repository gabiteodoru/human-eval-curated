candidate: incr_list;

check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(3;2;1)] = (4;3;2)];
    .qython.assert[candidate[(5;2;5;2;3;3;9;0;123)] = (6;3;6;3;4;4;10;1;124)]
    }
candidate: strange_sort_list;

check:{[candidate]
    .qython.assert[candidate[(1;2;3;4)] = (1;4;2;3)];
    .qython.assert[candidate[(5;6;7;8;9)] = (5;9;6;8;7)];
    .qython.assert[candidate[(1;2;3;4;5)] = (1;5;2;4;3)];
    .qython.assert[candidate[(5;6;7;8;9;1)] = (1;9;5;8;6;7)];
    .qython.assert[candidate[(5;5;5;5)] = (5;5;5;5)];
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;2;3;4;5;6;7;8)] = (1;8;2;7;3;6;4;5)];
    .qython.assert[candidate[(0;2;2;2;5;5;-5;-5)] = (-5;5;-5;5;0;2;2;2)];
    .qython.assert[(candidate[enlist 111111]) = enlist 111111];
    .qython.assert[1b]
    }
candidate: common;

check:{[candidate]
    .qython.assert[candidate[(1;4;3;34;653;2;5);(5;7;1;5;9;653;121)] = (1;5;653)];
    .qython.assert[candidate[(5;3;2;8);(3;2)] = (2;3)];
    .qython.assert[candidate[(4;3;2;8);(3;2;4)] = (2;3;4)];
    .qython.assert[candidate[(4;3;2;8);()] = ()]
    }
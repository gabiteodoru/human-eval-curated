candidate: solution;

check:{[candidate]
    .qython.assert[candidate[(5;8;7;1)] = 12];
    .qython.assert[candidate[(3;3;3;3;3)] = 9];
    .qython.assert[candidate[(30;13;24;321)] = 0];
    .qython.assert[candidate[(5;9)] = 5];
    .qython.assert[candidate[(2;4;8)] = 0];
    .qython.assert[candidate[(30;13;23;32)] = 23];
    .qython.assert[candidate[(3;13;2;9)] = 3]
    }    / Check some edge cases that are easy to work out by hand.
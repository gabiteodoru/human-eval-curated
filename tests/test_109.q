candidate: move_one_ball;

check:{[candidate]
    .qython.assert2[candidate[(3;4;5;1;2)] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(3;5;10;1;2)] = 1b];
    .qython.assert[candidate[(4;3;1;2)] = 0b];
    .qython.assert2[candidate[(3;5;4;1;2)] = 0b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[()] = 1b]
    }
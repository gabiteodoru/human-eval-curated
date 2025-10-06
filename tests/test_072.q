candidate: will_it_fly;

check:{[candidate]
    .qython.assert[candidate[(3;2;3);9]~1b];
    .qython.assert[candidate[(1;2);5]~0b];
    .qython.assert[(candidate[enlist 3;5])~1b];
    .qython.assert[candidate[(3;2;3);1]~0b];
    .qython.assert[candidate[(1;2;3);6]~0b];
    .qython.assert[(candidate[enlist 5;5])~1b]
    }
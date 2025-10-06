candidate: string_sequence;

check:{[candidate]
    .qython.assert[candidate[0]~enlist["0"]];
    .qython.assert[candidate[3]~("0 1 2 3")];
    .qython.assert[candidate[10]~("0 1 2 3 4 5 6 7 8 9 10")]
    }
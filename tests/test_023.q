candidate: strlen;

check:{[candidate]
    .qython.assert[candidate[""] = 0];
    .qython.assert[candidate[enlist["x"]] = 1];
    .qython.assert[candidate["asdasnakj"] = 9]
    }
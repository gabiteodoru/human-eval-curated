candidate: longest;

check:{[candidate]
    .qython.assert[candidate[()]~(::)];
    .qython.assert[candidate[(enlist["x"];enlist["y"];enlist["z"])]~enlist["x"]];
    .qython.assert[candidate[(enlist["x"];"yyy";"zzzz";"www";"kkkk";"abc")]~"zzzz"]
    }
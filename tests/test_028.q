candidate: concatenate;

check:{[candidate]
    .qython.assert[candidate[()] = ""];
    .qython.assert[candidate[(enlist["x"];enlist["y"];enlist["z"])] = "xyz"];
    .qython.assert[candidate[(enlist["x"];enlist["y"];enlist["z"];enlist["w"];enlist["k"])] = "xyzwk"]
    }
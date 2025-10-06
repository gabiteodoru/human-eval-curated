candidate: compare_one;

check:{[candidate]
    .qython.assert[candidate[1;2] = 2];
    .qython.assert[candidate[1;2.5] = 2.5];
    .qython.assert[candidate[2;3] = 3];
    .qython.assert[candidate[5;6] = 6];
    .qython.assert[candidate[1;"2,3"] = "2,3"];
    .qython.assert[candidate["5,1";enlist["6"]] = enlist["6"]];
    .qython.assert[candidate[enlist["1"];enlist["2"]] = enlist["2"]];
    .qython.assert[candidate[enlist["1"];1] = (::)];
    .qython.assert[1b]
    }
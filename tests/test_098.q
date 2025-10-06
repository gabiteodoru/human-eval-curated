candidate: count_upper;

check:{[candidate]
    .qython.assert[candidate["aBCdEf"] = 1];
    .qython.assert[candidate["abcdefg"] = 0];
    .qython.assert[candidate["dBBE"] = 0];
    .qython.assert[candidate[enlist["B"]] = 0];
    .qython.assert[candidate[enlist["U"]] = 1];
    .qython.assert[candidate[""] = 0];
    .qython.assert[candidate["EEEE"] = 2];
    .qython.assert[1b]
    }
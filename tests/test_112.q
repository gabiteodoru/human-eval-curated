candidate: reverse_delete;

check:{[candidate]
    .qython.assert[candidate["abcde";"ae"] = ("bcd";0b)];
    .qython.assert[candidate["abcdef";enlist["b"]] = ("acdef";0b)];
    .qython.assert[candidate["abcdedcba";"ab"] = ("cdedc";1b)];
    .qython.assert[candidate["dwik";enlist["w"]] = ("dik";0b)];
    .qython.assert[candidate[enlist["a"];enlist["a"]] = ("";1b)];
    .qython.assert[candidate["abcdedcba";""] = ("abcdedcba";1b)];
    .qython.assert[candidate["abcdedcba";enlist["v"]] = ("abcdedcba";1b)];
    .qython.assert[candidate["vabba";enlist["v"]] = ("abba";1b)];
    .qython.assert[candidate["mamma";"mia"] = ("";1b)]
    }
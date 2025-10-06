candidate: make_palindrome;

check:{[candidate]
    .qython.assert[candidate[""]~""];
    .qython.assert[candidate[enlist["x"]]~enlist["x"]];
    .qython.assert[candidate["xyz"]~"xyzyx"];
    .qython.assert[candidate["xyx"]~"xyx"];
    .qython.assert[candidate["jerry"]~"jerryrrej"]
    }
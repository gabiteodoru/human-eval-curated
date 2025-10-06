candidate: get_closest_vowel;

check:{[candidate]
    .qython.assert[candidate["yogurt"] = enlist["u"]];
    .qython.assert[candidate["full"] = enlist["u"]];
    .qython.assert[candidate["easy"] = ""];
    .qython.assert[candidate["eAsy"] = ""];
    .qython.assert[candidate["ali"] = ""];
    .qython.assert[candidate["bad"] = enlist["a"]];
    .qython.assert[candidate["most"] = enlist["o"]];
    .qython.assert[candidate["ab"] = ""];
    .qython.assert[candidate["ba"] = ""];
    .qython.assert[candidate["quick"] = ""];
    .qython.assert[candidate["anime"] = enlist["i"]];
    .qython.assert[candidate["Asia"] = ""];
    .qython.assert[candidate["Above"] = enlist["o"]];
    .qython.assert[1b]
    }
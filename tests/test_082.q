candidate: prime_length;

check:{[candidate]
    .qython.assert[candidate["Hello"] = 1b];
    .qython.assert[candidate["abcdcba"] = 1b];
    .qython.assert[candidate["kittens"] = 1b];
    .qython.assert[candidate["orange"] = 0b];
    .qython.assert[candidate["wow"] = 1b];
    .qython.assert[candidate["world"] = 1b];
    .qython.assert[candidate["MadaM"] = 1b];
    .qython.assert[candidate["Wow"] = 1b];
    .qython.assert[candidate[""] = 0b];
    .qython.assert[candidate["HI"] = 1b];
    .qython.assert[candidate["go"] = 1b];
    .qython.assert[candidate["gogo"] = 0b];
    .qython.assert[candidate["aaaaaaaaaaaaaaa"] = 0b];
    .qython.assert[candidate["Madam"] = 1b];
    .qython.assert[candidate[enlist["M"]] = 0b];
    .qython.assert[candidate[enlist["0"]] = 0b]
    }
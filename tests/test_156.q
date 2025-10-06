candidate: int_to_mini_roman;

check:{[candidate]
    .qython.assert[candidate[19] = "xix"];
    .qython.assert[candidate[152] = "clii"];
    .qython.assert[candidate[251] = "ccli"];
    .qython.assert[candidate[426] = "cdxxvi"];
    .qython.assert[candidate[500] = enlist["d"]];
    .qython.assert[candidate[1] = enlist["i"]];
    .qython.assert[candidate[4] = "iv"];
    .qython.assert[candidate[43] = "xliii"];
    .qython.assert[candidate[90] = "xc"];
    .qython.assert[candidate[94] = "xciv"];
    .qython.assert[candidate[532] = "dxxxii"];
    .qython.assert[candidate[900] = "cm"];
    .qython.assert[candidate[994] = "cmxciv"];
    .qython.assert[candidate[1000] = enlist["m"]];
    .qython.assert[1b]
    }
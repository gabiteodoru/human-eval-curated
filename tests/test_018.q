candidate: how_many_times;

check:{[candidate]
    .qython.assert[candidate["";enlist["x"]] = 0];
    .qython.assert[candidate["xyxyxyx";enlist["x"]] = 4];
    .qython.assert[candidate["cacacacac";"cac"] = 4];
    .qython.assert[(candidate["john doe";"john"]) = 1]
    }
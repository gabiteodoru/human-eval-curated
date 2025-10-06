candidate: closest_integer;

check:{[candidate]
    .qython.assert2[candidate["10"] = 10;"Test 1"];
    .qython.assert2[candidate["14.5"] = 15;"Test 2"];
    .qython.assert2[candidate["-15.5"] = -16;"Test 3"];
    .qython.assert2[candidate["15.3"] = 15;"Test 3"];
    .qython.assert2[candidate[enlist["0"]] = 0;"Test 0"]
    }
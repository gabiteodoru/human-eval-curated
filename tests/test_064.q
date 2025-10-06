candidate: vowels_count;

check:{[candidate]
    .qython.assert2[candidate["abcde"] = 2;"Test 1"];
    .qython.assert2[candidate["Alone"] = 3;"Test 2"];
    .qython.assert2[candidate["key"] = 2;"Test 3"];
    .qython.assert2[candidate["bye"] = 1;"Test 4"];
    .qython.assert2[candidate["keY"] = 2;"Test 5"];
    .qython.assert2[candidate["bYe"] = 1;"Test 6"];
    .qython.assert2[candidate["ACEDY"] = 3;"Test 7"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
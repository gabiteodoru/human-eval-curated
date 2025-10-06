candidate: special_factorial;

check:{[candidate]
    .qython.assert2[candidate[4] = 288;"Test 4"];
    .qython.assert2[candidate[5] = 34560;"Test 5"];
    .qython.assert2[candidate[7] = 125411328000;"Test 7"];
    .qython.assert2[candidate[1] = 1;"Test 1"]
    }
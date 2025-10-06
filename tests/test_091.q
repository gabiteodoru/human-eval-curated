candidate: is_bored;

check:{[candidate]
    .qython.assert2[(candidate["Hello world"]) = 0;"Test 1"];
    .qython.assert2[(candidate["Is the sky blue?"]) = 0;"Test 2"];
    .qython.assert2[(candidate["I love It !"]) = 1;"Test 3"];
    .qython.assert2[candidate["bIt"] = 0;"Test 4"];
    .qython.assert2[(candidate["I feel good today. I will be productive. will kill It"]) = 2;"Test 5"];
    .qython.assert2[(candidate["You and I are going for a walk"]) = 0;"Test 6"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
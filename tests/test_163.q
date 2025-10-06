candidate: generate_integers;

check:{[candidate]
    .qython.assert2[candidate[2;10] = (2;4;6;8);"Test 1"];
    .qython.assert2[candidate[10;2] = (2;4;6;8);"Test 2"];
    .qython.assert2[candidate[132;2] = (2;4;6;8);"Test 3"];
    .qython.assert2[candidate[17;89] = ();"Test 4"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
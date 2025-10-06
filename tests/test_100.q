candidate: make_a_pile;

check:{[candidate]
    .qython.assert2[candidate[3] = (3;5;7);"Test 3"];
    .qython.assert2[candidate[4] = (4;6;8;10);"Test 4"];
    .qython.assert[candidate[5] = (5;7;9;11;13)];
    .qython.assert[candidate[6] = (6;8;10;12;14;16)];
    .qython.assert[candidate[8] = (8;10;12;14;16;18;20;22)];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
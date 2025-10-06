candidate: even_odd_palindrome;

check:{[candidate]
    .qython.assert[candidate[123] = (8;13)];
    .qython.assert[candidate[12] = (4;6)];
    .qython.assert[candidate[3] = (1;2)];
    .qython.assert[candidate[63] = (6;8)];
    .qython.assert[candidate[25] = (5;6)];
    .qython.assert[candidate[19] = (4;6)];
    .qython.assert2[candidate[9] = (4;5);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1] = (0;1);"This prints if this assert fails 2 (also good for debugging!)"]
    }
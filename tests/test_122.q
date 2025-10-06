candidate: add_elements;

check:{[candidate]
    .qython.assert[candidate[(1;-2;-3;41;57;76;87;88;99);3] = -4];
    .qython.assert[candidate[(111;121;3;4000;5;6);2] = 0];
    .qython.assert[candidate[(11;21;3;90;5;6;7;8;9);4] = 125];
    .qython.assert2[candidate[(111;21;3;4000;5;6;7;8;9);4] = 24;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[(candidate[enlist 1;1]) = 1;"This prints if this assert fails 2 (also good for debugging!)"]
    }
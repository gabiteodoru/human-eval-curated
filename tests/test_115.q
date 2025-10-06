candidate: max_fill;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[((0;0;1;0);(0;1;0;0);(1;1;1;1));1] = 6;"Error"];
    .qython.assert2[candidate[((0;0;1;1);(0;0;0;0);(1;1;1;1);(0;1;1;1));2] = 5;"Error"];
    .qython.assert2[candidate[((0;0;0);(0;0;0));5] = 0;"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[((1;1;1;1);(1;1;1;1));2] = 4;"Error"];
    .qython.assert2[candidate[((1;1;1;1);(1;1;1;1));9] = 2;"Error"]
    }
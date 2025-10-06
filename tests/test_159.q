candidate: eat;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[5;6;10] = (11;4);"Error"];
    .qython.assert2[candidate[4;8;9] = (12;1);"Error"];
    .qython.assert2[candidate[1;10;10] = (11;0);"Error"];
    .qython.assert2[candidate[2;11;5] = (7;0);"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[4;5;7] = (9;2);"Error"];
    .qython.assert2[candidate[4;5;1] = (5;0);"Error"]
    }
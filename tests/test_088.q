candidate: sort_array;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[()] = ();"Error"];
    .qython.assert2[(candidate[enlist 5]) = enlist 5;"Error"];
    .qython.assert2[candidate[(2;4;3;0;1;5)] = (0;1;2;3;4;5);"Error"];
    .qython.assert2[candidate[(2;4;3;0;1;5;6)] = (6;5;4;3;2;1;0);"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[(2;1)] = (1;2);"Error"];
    .qython.assert2[candidate[(15;42;87;32;11;0)] = (0;11;15;32;42;87);"Error"];
    .qython.assert2[candidate[(21;14;23;11)] = (23;21;14;11);"Error"]
    }
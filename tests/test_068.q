candidate: pluck;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(4;2;3)] = (2;1);"Error"];
    .qython.assert2[candidate[(1;2;3)] = (2;1);"Error"];
    .qython.assert2[candidate[()] = ();"Error"];
    .qython.assert2[candidate[(5;0;3;0;4;2)] = (0;1);"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;0;5;3)] = (0;3);"Error"];
    .qython.assert2[candidate[(5;4;8;4;8)] = (4;1);"Error"];
    .qython.assert2[candidate[(7;6;7;1)] = (6;1);"Error"];
    .qython.assert2[candidate[(7;9;7;1)] = ();"Error"]
    }
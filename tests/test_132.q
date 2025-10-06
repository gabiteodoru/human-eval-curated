candidate: is_nested;

check:{[candidate]
    .qython.assert2[candidate["[[]]"] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate["[]]]]]]][[[[[]"] = 0b];
    .qython.assert[candidate["[][]"] = 0b];
    .qython.assert[candidate["[]"] = 0b];
    .qython.assert[candidate["[[[[]]]]"] = 1b];
    .qython.assert[candidate["[]]]]]]]]]]"] = 0b];
    .qython.assert[candidate["[][][[]]"] = 1b];
    .qython.assert[candidate["[[]"] = 0b];
    .qython.assert[candidate["[]]"] = 0b];
    .qython.assert[candidate["[[]][["] = 1b];
    .qython.assert[candidate["[[][]]"] = 1b];
    .qython.assert2[candidate[""] = 0b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate["[[[[[[[["] = 0b];
    .qython.assert[candidate["]]]]]]]]"] = 0b]
    }
candidate: simplify;

check:{[candidate]
    .qython.assert2[candidate["1/5";"5/1"] = 1b;"test1"];
    .qython.assert2[candidate["1/6";"2/1"] = 0b;"test2"];
    .qython.assert2[candidate["5/1";"3/1"] = 1b;"test3"];
    .qython.assert2[candidate["7/10";"10/2"] = 0b;"test4"];
    .qython.assert2[candidate["2/10";"50/10"] = 1b;"test5"];
    .qython.assert2[candidate["7/2";"4/2"] = 1b;"test6"];
    .qython.assert2[candidate["11/6";"6/1"] = 1b;"test7"];
    .qython.assert2[candidate["2/3";"5/2"] = 0b;"test8"];
    .qython.assert2[candidate["5/2";"3/5"] = 0b;"test9"];
    .qython.assert2[candidate["2/4";"8/4"] = 1b;"test10"];
    .qython.assert2[candidate["2/4";"4/2"] = 1b;"test11"];
    .qython.assert2[candidate["1/5";"5/1"] = 1b;"test12"];
    .qython.assert2[candidate["1/5";"1/5"] = 0b;"test13"]
    }
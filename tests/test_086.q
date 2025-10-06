candidate: anti_shuffle;

check:{[candidate]
    .qython.assert[candidate["Hi"] = "Hi"];
    .qython.assert[candidate["hello"] = "ehllo"];
    .qython.assert[candidate["number"] = "bemnru"];
    .qython.assert[candidate["abcd"] = "abcd"];
    .qython.assert[(candidate["Hello World!!!"]) = ("Hello !!!Wdlor")];
    .qython.assert[candidate[""] = ""];
    .qython.assert[(candidate["Hi. My name is Mister Robot. How are you?"]) = (".Hi My aemn is Meirst .Rboot How aer ?ouy")];
    .qython.assert[1b]
    }
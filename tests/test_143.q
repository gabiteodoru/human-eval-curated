candidate: words_in_sentence;

check:{[candidate]
    .qython.assert[(candidate["This is a test"]) = "is"];
    .qython.assert[(candidate["lets go for swimming"]) = ("go for")];
    .qython.assert[(candidate["there is no place available here"]) = ("there is no place")];
    .qython.assert[(candidate["Hi I am Hussein"]) = ("Hi am Hussein")];
    .qython.assert[(candidate["go for it"]) = ("go for it")];
    .qython.assert[candidate["here"] = ""];
    .qython.assert[(candidate["here is"]) = "is"]
    }
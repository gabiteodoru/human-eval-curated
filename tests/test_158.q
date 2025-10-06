candidate: find_max;

check:{[candidate]
    .qython.assert2[candidate[("name";"of";"string")] = "string";"t1"];
    .qython.assert2[candidate[("name";"enam";"game")] = "enam";"t2"];
    .qython.assert2[candidate[("aaaaaaa";"bb";"cc")] = "aaaaaaa";"t3"];
    .qython.assert2[candidate[("abc";"cba")] = "abc";"t4"];
    .qython.assert2[candidate[("play";"this";"game";"of";"footbott")] = "footbott";"t5"];
    .qython.assert2[candidate[("we";"are";"gonna";"rock")] = "gonna";"t6"];
    .qython.assert2[candidate[("we";"are";enlist["a"];"mad";"nation")] = "nation";"t7"];
    .qython.assert2[candidate[("this";"is";enlist["a"];"prrk")] = "this";"t8"];
    .qython.assert2[(candidate[enlist enlist["b"]]) = enlist["b"];"t9"];
    .qython.assert2[candidate[("play";"play";"play")] = "play";"t10"]
    }
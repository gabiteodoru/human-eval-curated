candidate: split_words;

check:{[candidate]
    .qython.assert[(candidate["Hello world!"]) = ("Hello";"world!")];
    .qython.assert[candidate["Hello,world!"] = ("Hello";"world!")];
    .qython.assert[(candidate["Hello world,!"]) = ("Hello";"world,!")];
    .qython.assert[(candidate["Hello,Hello,world !"]) = ("Hello,Hello,world";enlist["!"])];
    .qython.assert[candidate["abcdef"] = 3];
    .qython.assert[candidate["aaabb"] = 2];
    .qython.assert[candidate["aaaBb"] = 1];
    .qython.assert[candidate[""] = 0]
    }
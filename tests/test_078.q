candidate: hex_key;

check:{[candidate]
    .qython.assert2[candidate["AB"] = 1;raze[(.qython.String["First test error: "];.qython.String[candidate["AB"]])]];
    .qython.assert2[candidate["1077E"] = 2;raze[(.qython.String["Second test error: "];.qython.String[candidate["1077E"]])]];
    .qython.assert2[candidate["ABED1A33"] = 4;raze[(.qython.String["Third test error: "];.qython.String[candidate["ABED1A33"]])]];
    .qython.assert2[candidate["2020"] = 2;raze[(.qython.String["Fourth test error: "];.qython.String[candidate["2020"]])]];
    .qython.assert2[candidate["123456789ABCDEF0"] = 6;raze[(.qython.String["Fifth test error: "];.qython.String[candidate["123456789ABCDEF0"]])]];
    .qython.assert2[candidate["112233445566778899AABBCCDDEEFF00"] = 12;raze[(.qython.String["Sixth test error: "];.qython.String[candidate["112233445566778899AABBCCDDEEFF00"]])]];
    .qython.assert[candidate[()] = 0]
    }
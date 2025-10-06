candidate: iscube;

check:{[candidate]
    .qython.assert2[candidate[1] = 1b;raze[(.qython.String["First test error: "];.qython.String[candidate[1]])]];
    .qython.assert2[candidate[2] = 0b;raze[(.qython.String["Second test error: "];.qython.String[candidate[2]])]];
    .qython.assert2[candidate[-1] = 1b;raze[(.qython.String["Third test error: "];.qython.String[candidate[-1]])]];
    .qython.assert2[candidate[64] = 1b;raze[(.qython.String["Fourth test error: "];.qython.String[candidate[64]])]];
    .qython.assert2[candidate[180] = 0b;raze[(.qython.String["Fifth test error: "];.qython.String[candidate[180]])]];
    .qython.assert2[candidate[1000] = 1b;raze[(.qython.String["Sixth test error: "];.qython.String[candidate[1000]])]];
    .qython.assert2[candidate[0] = 1b;raze[(.qython.String["1st edge test error: "];.qython.String[candidate[0]])]];
    .qython.assert2[candidate[1729] = 0b;raze[(.qython.String["2nd edge test error: "];.qython.String[candidate[1728]])]]
    }
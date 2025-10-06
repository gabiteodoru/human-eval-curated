candidate: multiply;

check:{[candidate]
    .qython.assert2[candidate[148;412] = 16;raze[(.qython.String["First test error: "];.qython.String[candidate[148;412]])]];
    .qython.assert2[candidate[19;28] = 72;raze[(.qython.String["Second test error: "];.qython.String[candidate[19;28]])]];
    .qython.assert2[candidate[2020;1851] = 0;raze[(.qython.String["Third test error: "];.qython.String[candidate[2020;1851]])]];
    .qython.assert2[candidate[14;-15] = 20;raze[(.qython.String["Fourth test error: "];.qython.String[candidate[14;-15]])]];
    .qython.assert2[candidate[76;67] = 42;raze[(.qython.String["Fifth test error: "];.qython.String[candidate[76;67]])]];
    .qython.assert2[candidate[17;27] = 49;raze[(.qython.String["Sixth test error: "];.qython.String[candidate[17;27]])]];
    .qython.assert2[candidate[0;1] = 0;raze[(.qython.String["1st edge test error: "];.qython.String[candidate[0;1]])]];
    .qython.assert2[candidate[0;0] = 0;raze[(.qython.String["2nd edge test error: "];.qython.String[candidate[0;0]])]]
    }
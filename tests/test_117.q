candidate: select_words;

check:{[candidate]
    .qython.assert2[(candidate["Mary had a little lamb";4]) = enlist "little";raze[("First test error: ";.qython.String[candidate["Mary had a little lamb";4]])]];
    .qython.assert2[(candidate["Mary had a little lamb";3]) = ("Mary";"lamb");raze[("Second test error: ";.qython.String[candidate["Mary had a little lamb";3]])]];
    .qython.assert2[(candidate["simple white space";2]) = ();raze[("Third test error: ";.qython.String[candidate["simple white space";2]])]];
    .qython.assert2[(candidate["Hello world";4]) = enlist "world";raze[("Fourth test error: ";.qython.String[candidate["Hello world";4]])]];
    .qython.assert2[(candidate["Uncle sam";3]) = enlist "Uncle";raze[("Fifth test error: ";.qython.String[candidate["Uncle sam";3]])]];
    .qython.assert2[candidate["";4] = ();raze[("1st edge test error: ";.qython.String[candidate["";4]])]];
    .qython.assert2[(candidate["a b c d e f";1]) = (enlist["b"];enlist["c"];enlist["d"];enlist["f"]);raze[("2nd edge test error: ";.qython.String[candidate["a b c d e f";1]])]]
    }
candidate: largest_smallest_integers;

check:{[candidate]
    .qython.assert[.qython.rstreq[candidate[(2;4;1;3;5;7)] ; ((::);1)]];
    .qython.assert[.qython.rstreq[candidate[(2;4;1;3;5;7;0)] ; ((::);1)]];
    .qython.assert[.qython.rstreq[candidate[(1;3;2;4;5;6;-2)] ; (-2;1)]];
    .qython.assert[.qython.rstreq[candidate[(4;5;3;6;2;7;-7)] ; (-7;2)]];
    .qython.assert[.qython.rstreq[candidate[(7;3;8;4;9;2;5;-9)] ; (-9;2)]];
    .qython.assert[.qython.rstreq[candidate[()] ; ((::);(::))]];
    .qython.assert[.qython.rstreq[(candidate[enlist 0]) ; ((::);(::))]];
    .qython.assert[.qython.rstreq[candidate[(-1;-3;-5;-6)] ; (-1;(::))]];
    .qython.assert[.qython.rstreq[candidate[(-1;-3;-5;-6;0)] ; (-1;(::))]];
    .qython.assert[.qython.rstreq[candidate[(-6;-4;-4;-3;1)] ; (-3;1)]];
    .qython.assert[1b]
    }
candidate: correct_bracketing;

check:{[candidate]
    .qython.assert[candidate["<>"]];
    .qython.assert[candidate["<<><>>"]];
    .qython.assert[candidate["<><><<><>><>"]];
    .qython.assert[candidate["<><><<<><><>><>><<><><<>>>"]];
    .qython.assert[not candidate["<<<><>>>>"]];
    .qython.assert[not candidate["><<>"]];
    .qython.assert[not candidate[enlist["<"]]];
    .qython.assert[not candidate["<<<<"]];
    .qython.assert[not candidate[enlist[">"]]];
    .qython.assert[not candidate["<<>"]];
    .qython.assert[not candidate["<><><<><>><>><<>"]];
    .qython.assert[not candidate["<><><<><>><>>><>"]]
    }
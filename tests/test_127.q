candidate: intersection;

check:{[candidate]
    .qython.assert[candidate[(1;2);(2;3)] = "NO"];
    .qython.assert[candidate[(-1;1);(0;4)] = "NO"];
    .qython.assert[candidate[(-3;-1);(-5;5)] = "YES"];
    .qython.assert[candidate[(-2;2);(-4;0)] = "YES"];
    .qython.assert[candidate[(-11;2);(-1;-1)] = "NO"];
    .qython.assert[candidate[(1;2);(3;5)] = "NO"];
    .qython.assert[candidate[(1;2);(1;2)] = "NO"];
    .qython.assert[candidate[(-2;-2);(-3;-2)] = "NO"]
    }
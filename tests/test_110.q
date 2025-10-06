candidate: exchange;

check:{[candidate]
    .qython.assert[candidate[(1;2;3;4);(1;2;3;4)] = "YES"];
    .qython.assert[candidate[(1;2;3;4);(1;5;3;4)] = "NO"];
    .qython.assert[candidate[(1;2;3;4);(2;1;4;3)] = "YES"];
    .qython.assert[candidate[(5;7;3);(2;6;4)] = "YES"];
    .qython.assert[candidate[(5;7;3);(2;6;3)] = "NO"];
    .qython.assert[candidate[(3;2;6;1;8;9);(3;5;5;1;1;1)] = "NO"];
    .qython.assert[candidate[(100;200);(200;200)] = "YES"]
    }
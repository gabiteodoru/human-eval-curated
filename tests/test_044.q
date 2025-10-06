candidate: change_base;

check:{[candidate]
    .qython.assert[candidate[8;3] = "22"];
    .qython.assert[candidate[9;3] = "100"];
    .qython.assert[candidate[234;2] = "11101010"];
    .qython.assert[candidate[16;2] = "10000"];
    .qython.assert[candidate[8;2] = "1000"];
    .qython.assert[candidate[7;2] = "111"];
    x:2;
    while[x < 8;
        .qython.assert[candidate[x;x+1] = .qython.String[x]];
        x+:1
        ]
    }
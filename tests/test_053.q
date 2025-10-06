candidate: add;

check:{[candidate]
    system["S ",.qython.String 42];
    .qython.assert[candidate[0;1] = 1];
    .qython.assert[candidate[1;0] = 1];
    .qython.assert[candidate[2;3] = 5];
    .qython.assert[candidate[5;7] = 12];
    .qython.assert[candidate[7;5] = 12];
    do[100;
        (x;y):(.qython.randint[0;1001];.qython.randint[0;1001]);
        .qython.assert[candidate[x;y] = x+y]
        ]
    }
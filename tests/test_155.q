candidate: even_odd_count;

check:{[candidate]
    .qython.assert[candidate[7] = (0;1)];
    .qython.assert[candidate[-78] = (1;1)];
    .qython.assert[candidate[3452] = (2;2)];
    .qython.assert[candidate[346211] = (3;3)];
    .qython.assert[candidate[-345821] = (3;3)];
    .qython.assert[candidate[-2] = (1;0)];
    .qython.assert[candidate[-45347] = (2;3)];
    .qython.assert[candidate[0] = (1;0)];
    .qython.assert[1b]
    }
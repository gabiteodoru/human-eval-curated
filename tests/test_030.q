candidate: get_positive;

check:{[candidate]
    .qython.assert[candidate[(-1;-2;4;5;6)] = (4;5;6)];
    .qython.assert[candidate[(5;3;-5;2;3;3;9;0;123;1;-10)] = (5;3;2;3;3;9;123;1)];
    .qython.assert[count[candidate[(-1;-2)]] = 0];
    .qython.assert[count[candidate[()]] = 0]
    }
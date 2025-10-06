candidate: maximum;

check:{[candidate]
    .qython.assert[candidate[(-3;-4;5);3] = (-4;-3;5)];
    .qython.assert[candidate[(4;-4;4);2] = (4;4)];
    .qython.assert[candidate[(-3;2;1;2;-1;-2;1);1] = enlist 2];
    .qython.assert[candidate[(123;-123;20;0;1;2;-3);3] = (2;20;123)];
    .qython.assert[candidate[(-123;20;0;1;2;-3);4] = (0;1;2;20)];
    .qython.assert[candidate[(5;15;0;3;-13;-8;0);7] = (-13;-8;0;0;3;5;15)];
    .qython.assert[candidate[(-1;0;2;5;3;-10);2] = (3;5)];
    .qython.assert[candidate[(1;0;5;-7);1] = enlist 5];
    .qython.assert[candidate[(4;-4);2] = (-4;4)];
    .qython.assert[candidate[(-10;10);2] = (-10;10)];
    .qython.assert[candidate[(1;2;3;-23;243;-400;0);0] = ()]
    }
candidate: sum_product;

check:{[candidate]
    .qython.assert[candidate[()] = (0;1)];
    .qython.assert[candidate[(1;1;1)] = (3;1)];
    .qython.assert[candidate[(100;0)] = (100;0)];
    .qython.assert[candidate[(3;5;7)] = ((3+5)+7;(3*5)*7)];
    .qython.assert[(candidate[enlist 10]) = (10;10)]
    }
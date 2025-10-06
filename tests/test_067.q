candidate: fruit_distribution;

check:{[candidate]
    .qython.assert[(candidate["5 apples and 6 oranges";19]) = 8];
    .qython.assert[(candidate["5 apples and 6 oranges";21]) = 10];
    .qython.assert[(candidate["0 apples and 1 oranges";3]) = 2];
    .qython.assert[(candidate["1 apples and 0 oranges";3]) = 2];
    .qython.assert[(candidate["2 apples and 3 oranges";100]) = 95];
    .qython.assert[(candidate["2 apples and 3 oranges";5]) = 0];
    .qython.assert[(candidate["1 apples and 100 oranges";120]) = 19]
    }
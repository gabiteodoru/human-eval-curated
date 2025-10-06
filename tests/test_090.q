candidate: next_smallest;

check:{[candidate]
    .qython.assert[candidate[(1;2;3;4;5)] = 2];
    .qython.assert[candidate[(5;1;4;3;2)] = 2];
    .qython.assert[null candidate[()]];
    .qython.assert[null candidate[(1;1)]];
    .qython.assert[candidate[(1;1;1;1;0)] = 1];
    .qython.assert[null (candidate[(1;(.qython.int[0 xexp 0]))])];
    .qython.assert[candidate[(-35;34;12;-45)] = -35];
    .qython.assert[1b]
    }
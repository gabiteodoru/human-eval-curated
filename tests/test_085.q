candidate: add;

check:{[candidate]
    .qython.assert[candidate[(4;88)] = 88];
    .qython.assert[candidate[(4;5;6;7;2;122)] = 122];
    .qython.assert[candidate[(4;0;6;7)] = 0];
    .qython.assert[candidate[(4;4;6;8)] = 12]
    }    / Check some edge cases that are easy to work out by hand.
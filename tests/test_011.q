candidate: string_xor;

check:{[candidate]
    .qython.assert[candidate["111000";"101010"]~"010010"];
    .qython.assert[candidate[enlist["1"];enlist["1"]]~enlist["0"]];
    .qython.assert[candidate["0101";"0000"]~"0101"]
    }
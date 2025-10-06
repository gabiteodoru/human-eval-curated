candidate: truncate_number;

check:{[candidate]
    .qython.assert[candidate[3.5] = 0.5];
    .qython.assert[abs[candidate[1.33]-0.33] < 1e-6];
    .qython.assert[abs[candidate[123.456]-0.456] < 1e-6]
    }
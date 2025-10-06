candidate: mean_absolute_deviation;

check:{[candidate]
    .qython.assert[abs[candidate[(1.0;2.0;3.0)]-2.0%3.0] < 1e-6];
    .qython.assert[abs[candidate[(1.0;2.0;3.0;4.0)]-1.0] < 1e-6];
    .qython.assert[abs[candidate[(1.0;2.0;3.0;4.0;5.0)]-6.0%5.0] < 1e-6]
    }
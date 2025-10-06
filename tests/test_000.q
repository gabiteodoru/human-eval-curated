candidate: has_close_elements;

check:{[candidate]
    .qython.assert[candidate[(1.0;2.0;3.9;4.0;5.0;2.2);0.3] = 1b];
    .qython.assert[candidate[(1.0;2.0;3.9;4.0;5.0;2.2);0.05] = 0b];
    .qython.assert[candidate[(1.0;2.0;5.9;4.0;5.0);0.95] = 1b];
    .qython.assert[candidate[(1.0;2.0;5.9;4.0;5.0);0.8] = 0b];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0;2.0);0.1] = 1b];
    .qython.assert[candidate[(1.1;2.2;3.1;4.1;5.1);1.0] = 1b];
    .qython.assert[candidate[(1.1;2.2;3.1;4.1;5.1);0.5] = 0b]
    }
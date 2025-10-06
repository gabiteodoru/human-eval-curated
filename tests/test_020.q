candidate: find_closest_elements;

check:{[candidate]
    .qython.assert[candidate[(1.0;2.0;3.9;4.0;5.0;2.2)] = (3.9;4.0)];
    .qython.assert[candidate[(1.0;2.0;5.9;4.0;5.0)] = (5.0;5.9)];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0;2.2)] = (2.0;2.2)];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0;2.0)] = (2.0;2.0)];
    .qython.assert[candidate[(1.1;2.2;3.1;4.1;5.1)] = (2.2;3.1)]
    }
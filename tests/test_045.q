candidate: triangle_area;

check:{[candidate]
    .qython.assert[candidate[5;3] = 7.5];
    .qython.assert[candidate[2;2] = 2.0];
    .qython.assert[candidate[10;8] = 40.0]
    }
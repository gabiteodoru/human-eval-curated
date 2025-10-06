candidate: car_race_collision;

check:{[candidate]
    .qython.assert[candidate[2] = 4];
    .qython.assert[candidate[3] = 9];
    .qython.assert[candidate[4] = 16];
    .qython.assert[candidate[8] = 64];
    .qython.assert[candidate[10] = 100]
    }
candidate: x_or_y;

check:{[candidate]
    .qython.assert[candidate[7;34;12] = 34];
    .qython.assert[candidate[15;8;5] = 5];
    .qython.assert[candidate[3;33;5212] = 33];
    .qython.assert[candidate[1259;3;52] = 3];
    .qython.assert[candidate[7919;-1;12] = -1];
    .qython.assert[candidate[3609;1245;583] = 583];
    .qython.assert[candidate[91;56;129] = 129];
    .qython.assert[candidate[6;34;1234] = 1234];
    .qython.assert[candidate[1;2;0] = 0];
    .qython.assert[candidate[2;2;0] = 2]
    }
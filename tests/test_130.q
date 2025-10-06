candidate: tri;

check:{[candidate]
    .qython.assert[candidate[3] = (1.;3.;2.0;8.0)];
    .qython.assert[candidate[4] = (1.;3.;2.0;8.0;3.0)];
    .qython.assert[candidate[5] = (1.;3.;2.0;8.0;3.0;15.0)];
    .qython.assert[candidate[6] = (1.;3.;2.0;8.0;3.0;15.0;4.0)];
    .qython.assert[candidate[7] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0)];
    .qython.assert[candidate[8] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0;5.0)];
    .qython.assert[candidate[9] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0;5.0;35.0)];
    .qython.assert[candidate[20] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0;5.0;35.0;6.0;48.0;7.0;63.0;8.0;80.0;9.0;99.0;10.0;120.0;11.0)];
    .qython.assert[candidate[0] = enlist 1.];
    .qython.assert[candidate[1] = (1.;3.)]
    }
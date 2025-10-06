candidate: below_threshold;

check:{[candidate]
    .qython.assert[candidate[(1;2;4;10);100]];
    .qython.assert[not candidate[(1;20;4;10);5]];
    .qython.assert[candidate[(1;20;4;10);21]];
    .qython.assert[candidate[(1;20;4;10);22]];
    .qython.assert[candidate[(1;8;4;10);11]];
    .qython.assert[not candidate[(1;8;4;10);10]]
    }
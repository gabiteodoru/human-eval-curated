candidate: filter_integers;

check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(4;()!();();23.2;9;"adasd")] = (4;9)];
    .qython.assert[candidate[(3;enlist["c"];3;3;enlist["a"];enlist["b"])] = (3;3;3)]
    }
longest:{[strings]
    if[count[strings] = 0;
        :(::)
        ];
    lengths:{[s] count[s]} each strings;
    max_length:max[lengths];
    idx:.qython.index[lengths;max_length];
    :strings[idx]
    }
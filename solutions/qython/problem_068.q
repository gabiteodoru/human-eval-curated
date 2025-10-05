pluck:{[arr]
    if[count[arr] = 0;
        :()
        ];
    evens_mask:(arr mod 2) = 0;
    even_indices:where[evens_mask];
    if[count[even_indices] = 0;
        :()
        ];
    evens:arr[even_indices];
    min_even:min[evens];
    min_idx:.qython.index[arr;min_even];
    :(min_even;min_idx)
    }
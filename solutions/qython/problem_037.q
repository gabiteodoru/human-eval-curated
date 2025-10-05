sort_even:{[lst]
    "This function takes a list l and returns a list l'
    such that l' is identical to l in the odd indices, while its values at the even indices are equal
    to the values of the even indices of l, but sorted.
    ";
    even_indices:.qython.arange[0;count[lst];2];
    even_values:{[lst;i] lst[i]}[lst] each even_indices;
    sorted_evens:asc[even_values];
    result:{[x] x} each lst;
    i:0;
    while[i < count[even_indices];
        result[even_indices[i]]:sorted_evens[i];
        i+:1
        ];
    :result
    }
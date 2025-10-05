add_elements:{[arr;k]
    first_k:.qython.slice[arr;0N;k;0N];
    mask:first_k within (-99;99);
    filtered:first_k[where[mask]];
    :sum[filtered]
    }
add:{[lst]
    odd_indices:where[(.qython.arange[count[lst]] mod 2) = 1];
    values_at_odd:lst[odd_indices];
    even_values:values_at_odd[where[(values_at_odd mod 2) = 0]];
    :.qython.int[sum[even_values]]
    }
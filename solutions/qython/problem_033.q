sort_third:{[lst]
    "This function takes a list l and returns a list l'
    l'
    to the values of the corresponding indices of l, but sorted.
    ";
    indices_div_3:{[i] i} each .qython.arange[count[lst]] where {[i] (i mod 3) = 0} each .qython.arange[count[lst]];
    values_at_div_3:{[lst;i] lst[i]}[lst] each indices_div_3;
    sorted_values:asc[values_at_div_3];
    result:lst;
    result[indices_div_3]:sorted_values;
    :result
    }
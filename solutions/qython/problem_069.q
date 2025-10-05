search:{[lst]
    unique_vals:distinct[lst];
    frequencies:{[lst;val] (sum[lst = val])}[lst] each unique_vals;
    valid_vals:{[unique_vals;i] unique_vals[i]}[unique_vals] each .qython.arange[count[unique_vals]] where {[frequencies;unique_vals;i] frequencies[i] >= unique_vals[i]}[frequencies;unique_vals] each .qython.arange[count[unique_vals]];
    $[count[valid_vals] > 0;
        :max[valid_vals];
        :-1
      ]
    }
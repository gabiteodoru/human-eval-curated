is_sorted:{[lst]
    if[count[lst] <= 1;
        :1b
        ];
    sorted_check:all[(-1 _ lst) <= (1 _ lst)];
    if[not sorted_check;
        :0b
        ];
    unique_vals:distinct[lst];
    counts:{[lst;val] (sum[lst = val])}[lst] each unique_vals;
    if[any[counts > 2];
        :0b
        ];
    :1b
    }
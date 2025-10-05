pairs_sum_to_zero:{[lst]
    "
    pairs_sum_to_zero takes a list of integers as an input.
    it returns True if there are two distinct elements in the list that
    sum to zero, and False otherwise.
    ";
    n:count[lst];
    if[n < 2;
        :0b
        ];
    i:0;
    while[i < n;
        remaining:.qython.slice[lst;i+1;0N;0N];
        if[any[remaining = neg lst[i]];
            :1b
            ];
        i+:1
        ];
    :0b
    }
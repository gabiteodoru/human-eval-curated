count_ones:{[n]
    "Count number of 1s in binary representation";
    if[n < 0;
        :0
        ];
    ones:0;
    while[n > 0;
        ones+:n mod 2;
        n:n div 2
        ];
    :ones
    };
sort_array:{[arr]
    "
    In this Kata, you have to sort an array of non-negative integers according to
    number of ones in their binary representation in ascending order.
    For similar number of ones, sort based on decimal value.
    ";
    ones_counts:{[count_ones;x] count_ones[x]}[count_ones] each arr;
    sort_keys:{[ones_counts;arr;i] (ones_counts[i];arr[i])}[ones_counts;arr] each .qython.arange[count[arr]];
    sorted_keys:asc[sort_keys];
    result:{[x] x[1]} each sorted_keys;
    :result
    }
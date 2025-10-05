get_max_triples:{[num]
    "
    You are given a positive integer n. You have to create an integer array a of length n.
        For each i (1 ? i ? n), the value of a[i] = i * i - i + 1.
        Return the number of triples (a[i], a[j], a[k]) of a where i < j < k,
    and a[i] + a[j] + a[k] is a multiple of 3.
    ";
    indices:.qython.arange[1;num+1];
    a:((indices*indices)-indices)+1;
    mod_values:a mod 3;
    c0:sum[mod_values = 0];
    c1:sum[mod_values = 1];
    c2:sum[mod_values = 2];
    combinations:{[n_val;k_val]
        if[n_val < k_val;
            :0
            ];
        if[k_val = 0;
            :1
            ];
        result:1;
        i:0;
        while[i < k_val;
            result:result*n_val-i;
            result:result%i+1;
            i+:1
            ];
        :.qython.int[result]
        };
    result:((combinations[c0;3]+combinations[c1;3])+combinations[c2;3])+(c0*c1)*c2;
    :result
    }
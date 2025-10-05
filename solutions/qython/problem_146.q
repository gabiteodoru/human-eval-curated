specialFilter:{[nums]
    if[count[nums] = 0;
        :0
        ];
    greater_than_10:nums > 10;
    get_first_digit:{[n]
        s:.qython.String[.qython.str[abs[.qython.int[n]]]];
        :.qython.int[s[0]]
        };
    get_last_digit:{[n]
        :abs[.qython.int[n]] mod 10
        };
    first_digits:get_first_digit each nums;
    last_digits:get_last_digit each nums;
    first_is_odd:(first_digits mod 2) = 1;
    last_is_odd:(last_digits mod 2) = 1;
    valid:(greater_than_10&first_is_odd)&last_is_odd;
    :.qython.int[sum[valid]]
    }
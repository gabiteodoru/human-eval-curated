rounded_avg:{[n;m]
    if[n > m;
        :-1
        ];
    total:sum[.qython.arange[n;m+1]];
    cnt:(m-n)+1;
    average:total%cnt;
    rounded:.qython.round[average];
    binary_str:"0b";
    num:rounded;
    if[num = 0;
        :"0b0"
        ];
    bits:();
    while[num > 0;
        bits:raze[(enlist num mod 2;bits)];
        num:num div 2
        ];
    bit_chars:{[b] .qython.String[.qython.str[.qython.int[b]]]} each bits;
    binary_part:.qython.join[""; bit_chars];
    :raze[(binary_str;binary_part)]
    }
double_the_difference:{[lst]
    if[count[lst] = 0;
        :0
        ];
    total:0;
    i:0;
    while[i < count[lst];
        x:lst[i];
        if[(x > 0) and x = floor[x];
            remainder:.qython.int[x] mod 2;
            if[remainder = 1;
                total+:.qython.int[x*x]
                ]
            ];
        i+:1
        ];
    :total
    }
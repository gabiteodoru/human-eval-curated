is_simple_power:{[x;n]
    if[n = 1;
        :x = 1
        ];
    if[x = 1;
        :1b
        ];
    if[n <= 0;
        :0b
        ];
    power:n;
    while[power < x;
        power:power*n
        ];
    :power = x
    }
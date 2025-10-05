fibfib:{[n]
    if[n = 0;
        :0
        ];
    if[n = 1;
        :0
        ];
    if[n = 2;
        :1
        ];
    values:(0;0;1);
    i:3;
    while[i <= n;
        next_val:(values[i-1]+values[i-2])+values[i-3];
        values:raze[(values;enlist next_val)];
        i+:1
        ];
    :values[n]
    }
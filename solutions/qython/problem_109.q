move_one_ball:{[arr]
    if[count[arr] = 0;
        :1b
        ];
    breaks:0;
    break_idx:-1;
    i:0;
    while[i < count[arr]-1;
        if[arr[i] > arr[i+1];
            breaks+:1;
            break_idx:i
            ];
        i+:1
        ];
    if[breaks = 0;
        :1b
        ];
    if[breaks > 1;
        :0b
        ];
    :arr[count[arr]-1] <= arr[0]
    }
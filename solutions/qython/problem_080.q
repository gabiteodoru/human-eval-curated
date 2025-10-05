is_happy:{[s]
    "Check if a string is happy (length >= 3 and every 3 consecutive letters are distinct)";
    if[count[s] < 3;
        :0b
        ];
    i:0;
    while[i <= count[s]-3;
        window:.qython.slice[s;i;i+3;0N];
        if[count[distinct[window]] <> 3;
            :0b
            ];
        i+:1
        ];
    :1b
    }
cycpattern_check:{[a;b]
    "Check if any rotation of b is a substring in a";
    str_a:$[.qython.isinstance[a;.qython.str];a;.qython.String[a]];
    str_b:$[.qython.isinstance[b;.qython.str];b;.qython.String[b]];
    b_len:count[str_b];
    i:0;
    while[i < b_len;
        rotation:raze[(.qython.slice[str_b;i;0N;0N];.qython.slice[str_b;0N;i;0N])];
        a_len:count[str_a];
        rotation_len:count[rotation];
        if[rotation_len <= a_len;
            j:0;
            while[j <= a_len-rotation_len;
                substring:.qython.slice[str_a;j;j+rotation_len;0N];
                if[rotation~substring;
                    :1b
                    ];
                j+:1
                ]
            ];
        i+:1
        ];
    :0b
    }
how_many_times:{[text;sub]
    " Find how many times a given substring can be found in the original string. Count overlaping cases.
    ";
    if[count[sub] = 0;
        :0
        ];
    if[count[text] = 0;
        :0
        ];
    if[count[sub] > count[text];
        :0
        ];
    num_matches:0;
    max_start:(count[text]-count[sub])+1;
    i:0;
    while[i < max_start;
        match:1b;
        j:0;
        while[j < count[sub];
            if[text[i+j] <> sub[j];
                match:0b;
                j:count[sub]
                ];
            j+:1
            ];
        if[match;
            num_matches+:1
            ];
        i+:1
        ];
    :num_matches
    }
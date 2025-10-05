has_close_elements:{[numbers;threshold]
    "Check if any two numbers are closer than threshold.";
    n:count[numbers];
    idx:0;
    while[idx < n;
        current:numbers[idx];
        other_idx:idx+1;
        while[other_idx < n;
            if[abs[current-numbers[other_idx]] < threshold;
                :1b
                ];
            other_idx+:1
            ];
        idx+:1
        ];
    :0b
    }
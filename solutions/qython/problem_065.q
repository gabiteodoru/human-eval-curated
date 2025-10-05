circular_shift:{[x;shift]
    digits:.qython.String[.qython.str[x]];
    num_digits:count[digits];
    if[shift > num_digits;
        :reverse[digits]
        ];
    shift:shift mod num_digits;
    if[shift = 0;
        :digits
        ];
    left_part:.qython.slice[digits;0N;num_digits-shift;0N];
    right_part:.qython.slice[digits;num_digits-shift;0N;0N];
    :raze[(right_part;left_part)]
    }
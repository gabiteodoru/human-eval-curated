choose_num:{[x;y]
    if[y < x;
        :-1
        ];
    if[(y mod 2) = 0;
        :y
        ];
    if[(y-1) >= x;
        :y-1
        ];
    :-1
    }
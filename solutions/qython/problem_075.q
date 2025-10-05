is_prime:{[n]
    if[n < 2;
        :0b
        ];
    if[n = 2;
        :1b
        ];
    if[(n mod 2) = 0;
        :0b
        ];
    i:3;
    while[(i*i) <= n;
        if[(n mod i) = 0;
            :0b
            ];
        i+:2
        ];
    :1b
    };
is_multiply_prime:{[a]
    i:2;
    while[((i*i)*i) <= a;
        if[((a mod i) = 0) and is_prime[i];
            remainder:a div i;
            j:i;
            while[(j*j) <= remainder;
                if[((remainder mod j) = 0) and is_prime[j];
                    k:remainder div j;
                    if[is_prime[k];
                        :1b
                        ]
                    ];
                j+:1
                ]
            ];
        i+:1
        ];
    :0b
    }
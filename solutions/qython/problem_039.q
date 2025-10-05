is_prime:{[num]
    if[num < 2;
        :0b
        ];
    if[num = 2;
        :1b
        ];
    if[(num mod 2) = 0;
        :0b
        ];
    i:3;
    while[(i*i) <= num;
        if[(num mod i) = 0;
            :0b
            ];
        i+:2
        ];
    :1b
    };
prime_fib:{[n]
    fib_a:1;
    fib_b:2;
    prime_count:0;
    while[1b;
        if[is_prime[fib_b];
            prime_count+:1;
            if[prime_count = n;
                :fib_b
                ]
            ];
        fib_next:fib_a+fib_b;
        fib_a:fib_b;
        fib_b:fib_next
        ]
    }
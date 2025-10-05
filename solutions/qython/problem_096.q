count_up_to:{[num]
    "Find all prime numbers less than num";
    if[num <= 2;
        :()
        ];
    is_prime:{[x] 1} each .qython.arange[num];
    is_prime[0]:0;
    is_prime[1]:0;
    i:2;
    while[(i*i) < num;
        if[is_prime[i];
            j:i*i;
            while[j < num;
                is_prime[j]:0;
                j+:i
                ]
            ];
        i+:1
        ];
    :where[is_prime]
    }
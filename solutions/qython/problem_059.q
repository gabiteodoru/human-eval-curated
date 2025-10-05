largest_prime_factor:{[num]
    "Return the largest prime factor of n. Assume n > 1 and is not a prime.";
    n:num;
    largest:-1;
    while[(n mod 2) = 0;
        largest:2;
        n:n div 2
        ];
    i:3;
    while[(i*i) <= n;
        while[(n mod i) = 0;
            largest:i;
            n:n div i
            ];
        i+:2
        ];
    if[n > 1;
        largest:n
        ];
    :largest
    }
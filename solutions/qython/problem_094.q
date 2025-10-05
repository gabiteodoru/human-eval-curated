is_prime:{[n]
    "Check if a number is prime";
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
sum_digits:{[n]
    "Sum the digits of a number";
    s:.qython.String[.qython.str[n]];
    total:0;
    i:0;
    while[i < count[s];
        total+:.qython.int[s[i]];
        i+:1
        ];
    :total
    };
skjkasdkd:{[lst]
    "Find the largest prime value and return the sum of its digits.";
    largest_prime:-1;
    i:0;
    while[i < count[lst];
        num:lst[i];
        if[is_prime[num] and num > largest_prime;
            largest_prime:num
            ];
        i+:1
        ];
    if[largest_prime = -1;
        :0
        ];
    :sum_digits[largest_prime]
    }
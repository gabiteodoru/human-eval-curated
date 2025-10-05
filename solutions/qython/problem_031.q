is_prime:{[num]
    "Return true if a given number is prime, and false otherwise.";
    if[num < 2;
        :0b
        ];
    if[num = 2;
        :1b
        ];
    if[(num mod 2) = 0;
        :0b
        ];
    limit:.qython.int[num xexp 0.5];
    divisors:.qython.arange[3;limit+1;2];
    if[count[divisors] = 0;
        :1b
        ];
    remainders:num mod divisors;
    :all[remainders <> 0]
    }
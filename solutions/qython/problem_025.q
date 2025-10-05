factorize:{[n]
    "Return list of prime factors of given integer in the order from smallest to largest.
    Each of the factors should be listed number of times corresponding to how many times it appeares in factorization.
    Input number should be equal to the product of all factors
    ";
    factors:();
    divisor:2;
    while[(divisor*divisor) <= n;
        while[(n mod divisor) = 0;
            factors:raze[(factors;enlist divisor)];
            n:n div divisor
            ];
        divisor+:1
        ];
    if[n > 1;
        factors:raze[(factors;enlist n)]
        ];
    :factors
    }
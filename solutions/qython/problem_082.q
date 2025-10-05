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
prime_length:{[text]
    "Write a function that takes a string and returns True if the string
    length is a prime number or False otherwise";
    :is_prime[count[text]]
    }
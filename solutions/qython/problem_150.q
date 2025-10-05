is_prime:{[num]
    "Check if a number is prime";
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
x_or_y:{[n;x;y]
    "A simple program which should return the value of x if n is
    a prime number and should return the value of y otherwise.

    Examples:
    for x_or_y(7, 34, 12) == 34
    for x_or_y(15, 8, 5) == 5

    ";
    :$[is_prime[n];x;y]
    }
fib:{[n]
    "Return n-th Fibonacci number.";
    if[n <= 0;
        :0
        ];
    if[n = 1;
        :1
        ];
    a:0;
    b:1;
    i:2;
    while[i <= n;
        temp:a+b;
        a:b;
        b:temp;
        i+:1
        ];
    :b
    }
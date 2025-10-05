fib4:{[n]
    "The Fib4 number sequence is a sequence similar to the Fibbonacci sequence.
    fib4(0) -> 0
    fib4(1) -> 0
    fib4(2) -> 2
    fib4(3) -> 0
    fib4(n) -> fib4(n-1) + fib4(n-2) + fib4(n-3) + fib4(n-4).
    Please write a function to efficiently compute the n-th element of the fib4 number sequence.  Do not use recursion.
    ";
    if[n < 0;
        :0
        ];
    if[n <= 3;
        base_values:(0;0;2;0);
        :base_values[n]
        ];
    a:0;
    b:0;
    c:2;
    d:0;
    i:4;
    while[i <= n;
        new_val:((a+b)+c)+d;
        a:b;
        b:c;
        c:d;
        d:new_val;
        i+:1
        ];
    :d
    }
modp:{[n;p]
    "Return 2^n modulo p (be aware of numerics).";
    result:1;
    i:0;
    while[i < n;
        result:(result*2) mod p;
        i+:1
        ];
    :result
    }
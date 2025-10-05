tri:{[n]
    result:.qython.zeros[n+1];
    if[n >= 0;
        result[0]:1.0
        ];
    if[n >= 1;
        result[1]:3.0
        ];
    i:2;
    while[i <= n;
        $[(i mod 2) = 0;
            result[i]:1.0+i%2.0;
            result[i]:(result[i-1]+result[i-2])+1.0+(i+1)%2.0
          ];
        i+:1
        ];
    :result
    }
is_prime:{[n]
    "Check if n is a prime number";
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
intersection:{[interval1;interval2]
    "Determine if the length of intersection of two intervals is prime";
    start1:interval1[0];
    end1:interval1[1];
    start2:interval2[0];
    end2:interval2[1];
    start:$[start1 > start2;start1;start2];
    end:$[end1 < end2;end1;end2];
    $[start > end;
        length:0;
        length:end-start
      ];
    $[is_prime[length];
        :"YES";
        :"NO"
      ]
    }
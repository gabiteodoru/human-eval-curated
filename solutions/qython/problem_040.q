triples_sum_to_zero:{[lst]
    "
    triples_sum_to_zero takes a list of integers as an input.
    it returns True if there are three distinct elements in the list that
    sum to zero, and False otherwise.
    ";
    n:count[lst];
    if[n < 3;
        :0b
        ];
    i:0;
    while[i < n-2;
        j:i+1;
        while[j < n-1;
            k:j+1;
            while[k < n;
                if[((lst[i]+lst[j])+lst[k]) = 0;
                    :1b
                    ];
                k+:1
                ];
            j+:1
            ];
        i+:1
        ];
    :0b
    }
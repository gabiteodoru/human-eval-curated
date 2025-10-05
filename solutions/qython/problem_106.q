f:{[n]
    result:();
    i:1;
    while[i <= n;
        $[(i mod 2) = 0;
           [
            factorial:1;
            j:1;
            while[j <= i;
                factorial*:j;
                j+:1
                ];
            result:raze[(result;enlist factorial)]
           ];
           [
            total:0;
            j:1;
            while[j <= i;
                total+:j;
                j+:1
                ];
            result:raze[(result;enlist total)]
           ]
          ];
        i+:1
        ];
    :{[x] .qython.int[x]} each result
    }
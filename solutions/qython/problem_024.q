largest_divisor:{[n]
    " For a given number n, find the largest number that divides n evenly, smaller than n
    >>> largest_divisor(15)
    5
    ";
    i:n div 2;
    while[i >= 1;
        if[(n mod i) = 0;
            :i
            ];
        i-:1
        ];
    :1
    }
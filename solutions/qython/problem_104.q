has_only_odd_digits:{[n]
    "Check if number n has only odd digits (no even digits: 0,2,4,6,8)";
    while[n > 0;
        digit:n mod 10;
        if[(digit mod 2) = 0;
            :0b
            ];
        n:n div 10
        ];
    :1b
    };
unique_digits:{[x]
    "Given a list of positive integers x. return a sorted list of all
    elements that hasn't any even digit.

    Note: Returned list should be sorted in increasing order.

    For example:
    >>> unique_digits([15, 33, 1422, 1])
    [1, 15, 33]
    >>> unique_digits([152, 323, 1422, 10])
    []
    ";
    result:.qython.filter[has_only_odd_digits;x];
    :asc[result]
    }
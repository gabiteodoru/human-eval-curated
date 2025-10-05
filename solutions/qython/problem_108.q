sum_of_digits:{[n]
    "Calculate sum of signed digits where first digit of negative number is negative";
    if[n = 0;
        :0
        ];
    abs_n:abs[n];
    digits_str:.qython.String[.qython.str[abs_n]];
    total:sum[{[d] .qython.int[.qython.Char[d]]} each digits_str];
    if[n < 0;
        first_digit:.qython.int[.qython.Char[digits_str[0]]];
        total:total-2*first_digit
        ];
    :total
    };
count_nums:{[arr]
    "
    Write a function count_nums which takes an array of integers and returns
    the number of elements which has a sum of digits > 0.
    If a number is negative, then its first signed digit will be negative:
    e.g. -123 has signed digits -1, 2, and 3.
    ";
    if[count[arr] = 0;
        :0
        ];
    digit_sums:{[sum_of_digits;x] sum_of_digits[x]}[sum_of_digits] each arr;
    result:sum[{[ds] $[ds > 0;1;0]} each digit_sums];
    :result
    }
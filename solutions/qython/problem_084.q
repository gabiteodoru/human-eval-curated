solve:{[n]
    digits_str:.qython.String[.qython.str[n]];
    digit_sum:sum[{[char] .qython.int[char]} each digits_str];
    if[digit_sum = 0;
        :enlist["0"]
        ];
    binary_digits:();
    num:digit_sum;
    while[num > 0;
        binary_digits:raze[(enlist num mod 2;binary_digits)];
        num:num div 2
        ];
    result:.qython.join[""; {[d] .qython.String[.qython.str[d]]} each binary_digits];
    :result
    }
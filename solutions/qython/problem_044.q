change_base:{[x;base]
    "Change numerical base of input number x to base.
    return string representation after the conversion.
    base numbers are less than 10.
    ";
    if[x < base;
        :.qython.String[.qython.str[x]]
        ];
    digits:();
    while[x > 0;
        remainder:x mod base;
        digits:raze[(enlist remainder;digits)];
        x:x div base
        ];
    digit_chars:{[d] .qython.String[.qython.str[d]]} each digits;
    :.qython.join[""; digit_chars]
    }
decimal_to_binary:{[decimal]
    "Convert decimal to binary with 'db' prefix and suffix";
    if[decimal = 0;
        :"db0db"
        ];
    binary_digits:();
    n:decimal;
    while[n > 0;
        binary_digits:raze[(enlist (.qython.Char[.qython.str[n mod 2]]);binary_digits)];
        n:n div 2
        ];
    result:raze[("db";binary_digits;"db")];
    :result
    }
starts_one_ends:{[n]
    "
    Given a positive integer n, return the count of the numbers of n-digit
    positive integers that start or end with 1.
    ";
    if[n = 1;
        :1
        ];
    starts_with_1:10 xexp n-1;
    ends_with_1:9*10 xexp n-2;
    both:10 xexp n-2;
    :.qython.int[(starts_with_1+ends_with_1)-both]
    }
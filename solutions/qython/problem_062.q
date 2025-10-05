derivative:{[xs]
    "xs represent coefficients of a polynomial.
    xs[0] + xs[1] * x + xs[2] * x^2 + ....
    Return derivative of this polynomial in the same form.
    ";
    if[count[xs] <= 1;
        :()
        ];
    powers:.qython.arange[1;count[xs]];
    :(1 _ xs)*powers
    }
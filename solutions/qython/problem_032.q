poly:{[xs;x]
    "Evaluates polynomial with coefficients xs at point x.";
    powers:.qython.arange[count[xs]];
    :sum[xs*x xexp powers]
    };
poly_derivative:{[xs]
    "Returns coefficients of the derivative of polynomial xs";
    n:count[xs];
    if[n <= 1;
        :enlist 0.0
        ];
    indices:.qython.arange[1;n];
    :(1 _ xs)*indices
    };
find_zero:{[xs]
    "Find a zero of polynomial with coefficients xs using Newton-Raphson method";
    deriv_xs:poly_derivative[xs];
    x:0.0;
    max_iterations:1000;
    tolerance:1e-10;
    iteration:0;
    while[iteration < max_iterations;
        f_x:poly[xs;x];
        f_prime_x:poly[deriv_xs;x];
        if[abs[f_x] < tolerance;
            :x
            ];
        $[abs[f_prime_x] < tolerance;
            x+:1.0;
            x:x-f_x%f_prime_x
          ];
        iteration+:1
        ];
    :x
    }
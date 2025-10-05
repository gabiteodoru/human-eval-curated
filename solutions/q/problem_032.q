/ Helper function: evaluates polynomial with coefficients xs at point x
poly: {[xs;x] sum xs * x xexp til count xs};

/ Helper function: evaluates derivative of polynomial at point x
poly_deriv: {[xs;x] sum (1_xs) * (1+til count 1_xs) * x xexp til count 1_xs};

/ Main function: finds a zero of the polynomial using Newton's method
find_zero: {[xs]
  x0: 0f;                                    / initial guess
  iter: 0;                                   / iteration counter
  while[(abs[poly[xs;x0]] > 1e-10) and iter < 1000;
    x0: x0 - poly[xs;x0] % poly_deriv[xs;x0]; / Newton's method iteration
    iter+: 1
  ];
  x0
 };

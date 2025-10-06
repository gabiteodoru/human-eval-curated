/ Evaluates polynomial with coefficients xs at point x
poly: {[xs; x] sum xs * x xexp til count xs};

/ Finds a zero of polynomial with coefficients xs using Newton's method
find_zero: {[xs]
  x: 0f;
  dxs: (1 _ til count xs) * 1 _ xs;
  i: 0;
  while[(i < 100) and 1e-10 < abs poly[xs; x];
    x: x - poly[xs; x] % poly[dxs; x];
    i+: 1];
  x};

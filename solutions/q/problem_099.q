closest_integer: {[val]
  n: value val;
  f: floor n;
  frac: n - f;
  $[frac = 0.5;
    $[n >= 0; f + 1; f];
    $[frac < 0.5; f; f + 1]
  ]
 };

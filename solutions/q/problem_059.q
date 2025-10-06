largest_prime_factor: {[n]
  largest: 0;
  d: 2;
  while[n > 1;
    while[0 = n mod d;
      largest: d;
      n: n div d
    ];
    d+: 1;
    if[d*d > n; if[n > 1; largest: n]; n: 1]
  ];
  largest
 };

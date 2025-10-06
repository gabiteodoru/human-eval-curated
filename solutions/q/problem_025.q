factorize: {[n]
  factors: ();
  i: 2;
  while[n > 1;
    while[0 = n mod i;
      factors,: i;
      n: n div i
    ];
    i+: 1
  ];
  factors
 }

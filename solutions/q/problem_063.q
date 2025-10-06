fibfib: {[n]
  $[n<2; 0;
    n=2; 1;
    last {x,sum -3#x}/[n-2;0 0 1]
  ]
 };

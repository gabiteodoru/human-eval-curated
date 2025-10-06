is_simple_power:{[x;n]
  if[n=1; :x=1];
  if[x=1; :n>1];
  if[(n<=1) or x<=0; :0b];
  while[x>1;
    if[x mod n; :0b];
    x:x div n
  ];
  1b
  };

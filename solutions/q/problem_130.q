tri: {[n]
  if[n<0; :()];
  result: (n+1)#0f;
  result[0]: 1f;
  if[n=0; :result];
  result[1]: 3f;
  if[n=1; :result];

  / Compute up to n+1 if n is odd (to have tri(n+1) available)
  maxidx: n + (n mod 2);
  result: (maxidx+1)#0f;
  result[0]: 1f;
  result[1]: 3f;

  / Fill all even positions first
  evens: 2+2*til ceiling[(maxidx-1)%2];
  result[evens]: 1f + evens%2f;

  / Fill odd positions sequentially (each depends on previous odd)
  i: 3;
  while[i<=maxidx;
    result[i]: result[i-1] + result[i-2] + result[i+1];
    i+: 2
  ];

  / Return first n+1 elements
  :(n+1)#result
 }

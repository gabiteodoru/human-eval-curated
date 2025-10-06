/ Helper function to check if a number is prime
isPrime: {[n]
  if[n < 2; :0b];
  if[n = 2; :1b];
  if[0 = n mod 2; :0b];
  / Check all odd divisors from 3 up to sqrt(n)
  i: 3;
  limit: floor sqrt n;
  while[i <= limit;
    if[0 = n mod i; :0b];
    i+: 2
  ];
  1b
 };

/ Main function: return x if n is prime, otherwise return y
x_or_y: {[n; x; y]
  $[isPrime[n]; x; y]
 };

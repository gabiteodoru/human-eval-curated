/ Helper function to check if a number is prime
isPrime: {[n]
  if[n<2; :0b];
  if[n=2; :1b];
  if[0=n mod 2; :0b];
  all n mod 2+til floor sqrt n
  };

/ Main intersection function
intersection: {[interval1; interval2]
  / Find the intersection bounds
  start: max (interval1[0]; interval2[0]);
  end: min (interval1[1]; interval2[1]);

  / Check if intervals intersect
  if[start > end; :"NO"];

  / Calculate length of intersection (span, not count)
  len: end - start;

  / Return YES if length is prime, otherwise NO
  $[isPrime[len]; "YES"; "NO"]
  };

/ HumanEval/123: Get odd numbers from Collatz sequence

/ Helper function to generate Collatz sequence
collatz: {[n]
  seq: enlist n;
  while[n > 1;
    n: $[n mod 2; (3*n)+1; n div 2];
    seq,: n
  ];
  seq
 };

/ Main function: return sorted list of odd numbers in Collatz sequence
get_odd_collatz: {[n]
  seq: collatz[n];
  asc distinct seq where seq mod 2
 };

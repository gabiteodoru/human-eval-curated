modp: {[n; p]
  r: 1; b: 2 mod p; e: n;
  while[e > 0; $[e mod 2; r: (r * b) mod p; r]; b: (b * b) mod p; e: e div 2];
  r
 }

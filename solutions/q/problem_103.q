rounded_avg: {[n;m]
  $[n>m; -1;
    [a: avg n + til 1+m-n;
     r: `long$$[a=floor a; a; a=(ceiling a); a; (a-floor a)=0.5; $[0=(floor a) mod 2; floor a; ceiling a]; floor 0.5+a];
     bits: string 0b vs r;
     "0b",raze (bits?"1") _ bits]
  ]
 };

starts_one_ends:{[n]
  $[n=1;
    1;
    [starts:10 xexp n-1;
     ends:9*10 xexp n-2;
     both:10 xexp n-2;
     "j"$starts+ends-both]
  ]
 };

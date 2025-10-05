get_max_triples:{[n]
  i:1+til n;
  a:(i*i)-(i-1);
  mod3:a mod 3;
  c0:sum mod3=0;
  c1:sum mod3=1;
  c2:sum mod3=2;
  comb3:{(x*(x-1)*(x-2)) div 6};
  (comb3 c0) + (comb3 c1) + (comb3 c2) + (c0*c1*c2)
  }

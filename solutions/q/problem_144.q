simplify: {[x;n]
  xf: "J"$"/" vs x;
  nf: "J"$"/" vs n;
  num: prd xf[0],nf[0];
  den: prd xf[1],nf[1];
  0 = num mod den
 }

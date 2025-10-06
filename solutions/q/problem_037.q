sort_even: {[l]
  evenIdx: where 0 = (til count l) mod 2;
  result: l;
  result[evenIdx]: asc l[evenIdx];
  result
 }

sort_third: {[l]
  idx: where 0 = (til count l) mod 3;
  @[l; idx; :; asc l[idx]]
 }

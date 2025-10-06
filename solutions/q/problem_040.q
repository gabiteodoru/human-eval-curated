triples_sum_to_zero: {[lst]
  n: count lst;
  if[n<3; :0b];
  indices: til n;
  combos: cross[cross[indices;indices];indices];
  valid: combos where {(x[0]<x[1]) and x[1]<x[2]} each combos;
  any 0={[l;idx] sum l[idx]}[lst] each valid
  }

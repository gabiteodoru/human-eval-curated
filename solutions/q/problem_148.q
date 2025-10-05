bf: {[planet1;planet2]
  planets: `Mercury`Venus`Earth`Mars`Jupiter`Saturn`Uranus`Neptune;
  i1: planets?planet1;
  i2: planets?planet2;
  if[(i1>=count planets)|i2>=count planets; :`$()];
  diff: abs[i2-i1];
  if[diff<=1; :`$()];
  indices: ((i1&i2)+1) + til diff-1;
  planets indices
 }

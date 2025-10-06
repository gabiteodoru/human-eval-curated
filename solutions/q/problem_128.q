prod_signs: {[arr]
  if[0=count arr; :()];
  signs: signum arr;
  prod: prd signs;
  sum_mag: sum abs arr;
  prod * sum_mag}

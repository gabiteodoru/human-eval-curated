histogram: {[test]
  if[0=count test; :()!()];
  letters: `$" " vs test;
  letters: letters where not null letters;
  if[0=count letters; :()!()];
  counts: count each group letters;
  k: key[counts] where value[counts] = max value counts;
  v: value[counts] where value[counts] = max value counts;
  k!v
  };

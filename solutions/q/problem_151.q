double_the_difference: {[lst]
  if[0=count lst; :0];
  / Filter: positive, integer, and odd
  valid: (lst > 0) & (lst = floor lst) & (1 = lst mod 2);
  / Sum of squares of valid numbers
  sum (lst * lst) * valid
  };

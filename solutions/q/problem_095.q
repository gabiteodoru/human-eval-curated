check_dict_case:{[dict]
  / Return False if empty
  if[0=count dict; :0b];
  / Get keys
  k:key dict;
  / Check if all keys are symbols
  if[not all -11h=type each k; :0b];
  / Convert to strings
  ks:string k;
  / Check if all lowercase or all uppercase
  all_lower:all ks~'lower ks;
  all_upper:all ks~'upper ks;
  all_lower or all_upper
  };

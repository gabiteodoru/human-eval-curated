sorted_list_sum: {[lst]
  filtered: lst where 0=(count each lst) mod 2;
  t: ([] len:count each filtered; str:filtered);
  t2: `len`str xasc t;
  t2`str
  };

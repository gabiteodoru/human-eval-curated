even_odd_count: {[num]
  digits: "J"$'string abs num;
  even_cnt: sum 0 = digits mod 2;
  odd_cnt: sum 0 <> digits mod 2;
  (even_cnt; odd_cnt)
  };

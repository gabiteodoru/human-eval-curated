odd_count:{[lst]
  {[s]
    cnt: sum (("i"$s) - "i"$"0") mod 2;
    template: "the number of odd elements in the string i of the input.";
    ssr[template;"i";string cnt]
  } each lst
  }

circular_shift: {[x;shift]
  digits: string x;
  n: count digits;
  $[shift > n; reverse digits; neg[shift] rotate digits]
  }

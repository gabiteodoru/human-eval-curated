search: {[lst]
  freqs: count each group lst;
  vals: key freqs;
  counts: value freqs;
  valid: vals where counts >= vals;
  $[count valid; max valid; -1]
  }

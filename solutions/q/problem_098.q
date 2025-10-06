count_upper: {[s]
  evenChars: s[2 * til ceiling (count s) % 2];
  sum evenChars in "AEIOU"
  };

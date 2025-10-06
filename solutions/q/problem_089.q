encrypt: {[s]
  codes: `int$s;
  shifted: 97 + ((codes - 97) + 4) mod 26;
  `char$shifted
 };

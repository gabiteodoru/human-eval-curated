split_words: {[txt]
  $[" " in txt;
    " " vs txt;
    "," in txt;
    "," vs txt;
    / Count lowercase letters with odd positions
    sum ((txt >= "a") & (txt <= "z")) & 1 = (("i"$txt) - "i"$"a") mod 2
  ]
 };

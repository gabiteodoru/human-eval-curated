decimal_to_binary: {[n]
  bits: 0b vs n;
  / If all zeros (n=0), use "0", otherwise drop leading zeros
  binary: $[n=0; "0"; raze string (first where bits) _ bits];
  "db",binary,"db"
  };

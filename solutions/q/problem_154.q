cycpattern_check: {[a;b]
  rotations: (til count b) rotate\: b;
  any {count ss[x;y]} [a;] each rotations
 };

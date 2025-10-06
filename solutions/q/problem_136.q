largest_smallest_integers: {[lst]
  negs: lst where lst<0;
  pos: lst where lst>0;
  a: $[0=count negs; 0N; max negs];
  b: $[0=count pos; 0N; min pos];
  (a;b)
 }

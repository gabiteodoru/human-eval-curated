separate_paren_groups: {[paren_string]
  s: paren_string except " ";
  depths: sums ?[s="(";1;-1];
  endpoints: where depths=0;
  cutpoints: 1+endpoints;
  (0,cutpoints except count s) cut s
  }

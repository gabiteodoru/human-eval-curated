how_many_times: {[str;substr] n: count substr; $[0 = n; 0; n > count str; 0; sum {all x = y}[;substr] each {[s;len;pos] pos _ (pos + len) # s}[str;n] each til 1 + (count str) - n] };

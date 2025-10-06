choose_num: {[x;y] $[y<x; -1; $[0=y mod 2; y; $[y-1>=x; y-1; -1]]]};

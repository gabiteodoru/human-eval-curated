sum_squares: {[lst] $[0=count lst; 0; sum {[idx;val] $[0=idx mod 3; val*val; 0=idx mod 4; val*val*val; val]}'[til count lst; lst]]}

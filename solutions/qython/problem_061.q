correct_bracketing:{[brackets]
    chars:{[c] c} each brackets;
    values:{[c] $[c~"(";1;-1]} each chars;
    cumsum:sums[values];
    :(({$[0<=i:count[x]-1;x i;'length]}cumsum) = 0) and min[cumsum] >= 0
    }
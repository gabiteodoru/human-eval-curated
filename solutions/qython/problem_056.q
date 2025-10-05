correct_bracketing:{[brackets]
    values:{[char] $[char~"<";1;-1]} each brackets;
    depth:sums[values];
    :(min[depth] >= 0) and ({$[0<=i:count[x]-1;x i;'length]}depth) = 0
    }
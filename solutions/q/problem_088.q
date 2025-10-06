sort_array:{[arr] $[0=count arr; arr; 1=count arr; arr; (sum (first arr; last arr)) mod 2; asc arr; desc arr]}

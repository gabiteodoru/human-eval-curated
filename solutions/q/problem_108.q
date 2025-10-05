/ Helper function to calculate sum of digits
/ For negative numbers, the first digit is negative
digitsum: {[n] $[n=0; 0; n>0; sum 10 vs n; neg[first 10 vs abs n] + sum 1_ 10 vs abs n]};

/ Count elements where sum of digits > 0
count_nums: {[arr] $[0=count arr; 0; sum (digitsum each arr) > 0]};

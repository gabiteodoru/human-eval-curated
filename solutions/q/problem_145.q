/ Helper function to calculate sum of digits
/ For negative numbers, only the first digit is negative
digitSum: {[n]
  $[n=0; 0;
    n<0; neg[first ds] + sum 1_ ds: 10 vs abs n;
    sum 10 vs n]
  };

/ Main function to sort integers by sum of their digits
/ Preserves original order for items with same digit sum (stable sort)
order_by_points: {[nums]
  $[0=count nums;
    nums;
    nums[last each asc flip (digitSum each nums; til count nums)]]
  };

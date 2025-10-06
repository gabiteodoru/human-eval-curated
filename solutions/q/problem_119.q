/ Helper function to check if parentheses are balanced
isBalanced: {[s]
  / Convert each character to +1 for '(' and -1 for ')'
  vals: {$[x="(";1;-1]} each s;
  / Running sum should never go negative and should end at 0
  runningSum: sums vals;
  (0=last runningSum) and (min runningSum)>=0
  };

/ Main function
match_parens: {[lst]
  / Try both concatenation orders
  s1: lst[0],lst[1];
  s2: lst[1],lst[0];
  / Check if either is balanced
  result: isBalanced[s1] or isBalanced[s2];
  $[result;"Yes";"No"]
  };

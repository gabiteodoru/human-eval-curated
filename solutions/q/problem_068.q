pluck: {[arr]
  if[0=count arr; :()];
  evens: where 0=arr mod 2;
  if[0=count evens; :()];
  vals: arr[evens];
  minVal: min vals;
  idx: first evens where vals=minVal;
  (minVal;idx)
 }

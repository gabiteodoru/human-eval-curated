strange_sort_list: {[lst]
  sorted: asc lst;
  n: count sorted;
  pairs: floor n%2;
  front: til pairs;
  back: reverse ((n-pairs) + til pairs);
  indices: raze (front,'back);
  indices: indices, (pairs + til n mod 2);
  sorted[indices]
  }

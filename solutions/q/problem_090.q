next_smallest: {[lst]
  distinct_sorted: asc distinct lst;
  $[2 <= count distinct_sorted; distinct_sorted[1]; 0N]
  }

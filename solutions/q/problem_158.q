find_max: {[words]
  unique_counts: count each distinct each words;
  maxcount: max unique_counts;
  indices: where unique_counts = maxcount;
  candidates: words[indices];
  first asc candidates
 };

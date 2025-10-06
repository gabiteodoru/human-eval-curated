total_match: {[lst1;lst2]
  count1: sum 0, count each lst1;
  count2: sum 0, count each lst2;
  $[count1 <= count2; lst1; lst2]
 };

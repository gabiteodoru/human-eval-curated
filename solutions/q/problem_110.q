exchange: {[lst1;lst2]
  totalEven: sum not (lst1,lst2) mod 2;
  needed: count lst1;
  $[totalEven >= needed; "YES"; "NO"]
  }

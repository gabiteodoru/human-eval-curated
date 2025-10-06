by_length: {[arr]
  digitNames: `One`Two`Three`Four`Five`Six`Seven`Eight`Nine;
  filtered: arr where (arr >= 1) and (arr <= 9);
  sorted: asc filtered;
  reversed: reverse sorted;
  digitNames[reversed - 1]
 };

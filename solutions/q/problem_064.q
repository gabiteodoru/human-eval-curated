vowels_count:{[s]
  regular:sum s in "aeiouAEIOU";
  endy:(last s) in "yY";
  regular + endy
 }

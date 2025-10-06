select_words:{[s;n]
  / Handle empty string case
  if[0=count s; :()];
  / Split into words
  words:" " vs s;
  / Count consonants for each word
  consonantCounts:{count x where not x in "aeiouAEIOU"} each words;
  / Select words with exactly n consonants
  words where consonantCounts = n
 };

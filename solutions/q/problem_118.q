get_closest_vowel:{[word]
  if[3>count word; :""];
  vowel_mask:word in "aeiouAEIOU";
  / Check positions 1 to n-2, search from right
  indices:reverse 1_-1_til count word;
  / Find first index where: vowel at i, consonants at i-1 and i+1
  idx:first indices where {[vm;i] vm[i] and (not vm[i-1]) and not vm[i+1]}[vowel_mask;] each indices;
  $[null idx; ""; string word[idx]]
 };

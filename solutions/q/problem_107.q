even_odd_palindrome: {[n]
  isPalin: {s:string x; s~reverse s};
  nums: 1 + til n;
  palindromes: nums where isPalin each nums;
  evenCount: sum 0 = palindromes mod 2;
  oddCount: sum 1 = palindromes mod 2;
  (evenCount; oddCount)
 };

/ Helper function to check if a number is prime
isPrime: {[n] $[n<2; 0b; n=2; 1b; not any 0=n mod 2_til 1+floor sqrt n]};

/ Main function to filter words with prime length
words_in_sentence: {[sentence] words: " " vs sentence; primeWords: words where isPrime each count each words; " " sv primeWords};

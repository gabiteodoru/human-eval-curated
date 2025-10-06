/ Helper function to check if a number is prime
isPrime: {[n] $[n<2; 0b; not any 0=n mod 2+til n-2; 1b; 0b]};

/ Main function: returns true if string length is prime
prime_length: {[s] isPrime count s};

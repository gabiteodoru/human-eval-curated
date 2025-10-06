/ Helper function to check if a number is prime
isPrime: {[x] $[x<2; 0b; x in 2 3; 1b; not any 0=x mod 2_til 1+floor sqrt x]};

/ Main function to count up to n
count_up_to: {[n] where isPrime each til n};

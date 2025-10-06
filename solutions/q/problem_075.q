/ Helper function to check if a number is prime
isPrime: {[n] $[n<2; 0b; n in 2 3; 1b; (n mod 2)=0; 0b; not any 0=(n mod 3+2*til floor sqrt[n]%2); 1b; 0b]};

is_multiply_prime: {[a]
  / Get all primes up to a
  primes: where isPrime each til a+1;
  / For each combination of 3 primes (with replacement), check if product equals a
  / We only need primes up to a, and each prime can appear multiple times
  n: count primes;
  / Check all triples (i,j,k) where i<=j<=k
  combinations: raze {[primes;i]
    raze {[primes;i;j]
      {[primes;i;j;k] (primes[i]; primes[j]; primes[k])} [primes;i;j;] each (j+til (count[primes]-j))
    } [primes;i;] each (i+til (count[primes]-i))
  } [primes;] each til n;
  / Check if any combination multiplies to a
  any a = prd each combinations
 };

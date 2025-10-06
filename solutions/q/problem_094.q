/ Check if a number is prime
isPrime: {[n]
  if[n<2; :0b];
  if[n=2; :1b];
  if[0=n mod 2; :0b];
  limit: floor sqrt n;
  divisors: 2_til 1+limit;
  all 0<>n mod divisors
 };

/ Sum digits of a number
sumDigits: {[n]
  sum -48+"i"$string n
 };

/ Main function: find largest prime and return sum of its digits
skjkasdkd: {[lst]
  primes: lst where isPrime each lst;
  if[0=count primes; :0];
  sumDigits max primes
 };

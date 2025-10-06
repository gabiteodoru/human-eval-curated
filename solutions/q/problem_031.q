is_prime: {[n] $[n<2; 0b; n=2; 1b; 0=n mod 2; 0b; not any 0=n mod 3+2*til floor sqrt[n]%3; 1b; 0b]};

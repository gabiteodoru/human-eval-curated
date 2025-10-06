isPrime: {[x] if[x<2; :0b]; if[x=2; :1b]; if[0=x mod 2; :0b]; all x mod/: 2+til floor sqrt x};

prime_fib: {[n] a:0; b:1; cnt:0; while[cnt<n; tmp:a+b; a:b; b:tmp; if[isPrime b; cnt+:1]]; b};

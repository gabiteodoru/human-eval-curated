fib4: {[n] if[n<4; :(0 0 2 0)[n]]; state: 0 0 2 0; i:0; while[i<n-3; state: state[1],state[2],state[3],sum state; i+:1]; last state};

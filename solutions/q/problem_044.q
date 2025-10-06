change_base:{[x;base]
  $[x=0; "0";
    [seq: {x div y}[;base] scan x;
     remainders: -1 _ seq mod base;
     raze reverse string remainders]]
  };

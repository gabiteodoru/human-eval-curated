decode_cyclic:{[s]
  $[10h=type s; s; s:string s];
  $[0=count s; s;
    [groups:0N 3#s;
     decoded:{$[3=count x; (last x),(-1)_x; x]} each groups;
     raze decoded]]}

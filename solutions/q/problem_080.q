is_happy: {[s]
  if[3>count s; :0b];
  windows: {3 sublist x _ y}[;s] each til 1+count[s]-3;
  all 3=count each distinct each windows
  }

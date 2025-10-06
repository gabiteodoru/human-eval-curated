any_int: {[x;y;z]
  / Check if all three are integers
  allInt: all (x;y;z)~'floor each (x;y;z);
  / Check if one equals sum of other two
  sumCheck: (x=y+z) or (y=x+z) or (z=x+y);
  / Return true only if both conditions met
  allInt and sumCheck
 };

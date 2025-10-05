encode: {[message]
  vowelMap: "aeiouAEIOU"!"cgkqwCGKQW";
  / First swap case
  swapped: {$[x within ("A";"Z"); lower x; x within ("a";"z"); upper x; x]} each message;
  / Then replace vowels
  {$[x in key vowelMap; vowelMap[x]; x]} each swapped
 }

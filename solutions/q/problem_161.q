solve:{[s]
  hasLetters: any (s within "az") | s within "AZ";
  $[hasLetters;
    {$[x within "az"; upper x; x within "AZ"; lower x; x]} each s;
    reverse s
  ]
 }

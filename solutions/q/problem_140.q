fix_spaces: {[text]
  / Split into runs of same character type (space vs non-space)
  isSpace: text=" ";
  boundaries: differ isSpace;
  runIds: sums boundaries;
  / Process each run in order
  result: "";
  i: 0;
  while[i <= max runIds;
    indices: where runIds=i;
    if[count indices;
      chars: text[indices];
      if[all chars=" ";
        n: count chars;
        result,: $[n>=3; "-"; n=2; "__"; "_"]
      ];
      if[not all chars=" ";
        result,: chars
      ]
    ];
    i+: 1
  ];
  result
  };

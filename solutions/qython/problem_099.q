closest_integer:{[val]
    num:.qython.float[val];
    floored:num-num mod 1;
    frac:num-floored;
    $[frac = 0.5;
        $[num >= 0;
            :.qython.int[floored]+1;
            :.qython.int[floored]
          ];
        $[frac < 0.5;
            :.qython.int[floored];
            :.qython.int[floored]+1
          ]
      ]
    }
solve:{[s]
    lowercase:.qython.String[.Q.a];
    uppercase:.qython.String[.Q.A];
    swap_case:{[lowercase;uppercase;c]
        $[c within ("a";"z");
           [
            idx:.qython.index[lowercase;c];
            :uppercase[idx]
           ];
          c within ("A";"Z");
           [
            idx:.qython.index[uppercase;c];
            :lowercase[idx]
           ];
            :c
          ]
        }[lowercase;uppercase];
    has_letters:any[{[c] (c within ("A";"Z")) or (c within ("a";"z"))} each s];
    $[not has_letters;
        :reverse[s];
       [
        result:{[swap_case;c] swap_case[c]}[swap_case] each s;
        :.qython.join[""; result]
       ]
      ]
    }
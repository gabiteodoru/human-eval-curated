compare_one:{[a;b]
    "
    Compare two values and return the larger one in its original type.
    Return None if they are equal.
    ";
    to_float:{[val]
        $[.qython.isinstance[val;.qython.float];
            :val;
          .qython.isinstance[val;.qython.int];
            :.qython.float[val];
           [
            str_val:.qython.replace[val; enlist[","]; enlist["."]];
            :.qython.float[.qython.str[str_val]]
           ]
          ]
        };
    a_num:to_float[a];
    b_num:to_float[b];
    $[a_num > b_num;
        :a;
      b_num > a_num;
        :b;
        :(::)
      ]
    }
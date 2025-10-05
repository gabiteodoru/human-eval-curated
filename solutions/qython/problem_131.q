digits:{[num]
    num_str:.qython.str[num];
    digit_list:{[c] .qython.int[.qython.Char[c]]} each .qython.String[num_str];
    odd_digits:{[d] d} each digit_list where {[d] (d mod 2) = 1} each digit_list;
    $[count[odd_digits] = 0;
        :0;
        :prd[odd_digits]
      ]
    }
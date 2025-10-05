digit_sum:{[n]
    "Calculate sum of digits, handling negative numbers specially";
    $[n < 0;
       [
        s:.qython.String[.qython.str[abs[n]]];
        digits:{[s;i] .qython.int[.qython.Char[s[i]]]}[s] each .qython.arange[count[s]];
        result:(neg digits[0])+(sum[1 _ digits]);
        :result
       ];
       [
        s:.qython.String[.qython.str[n]];
        digits:{[s;i] .qython.int[.qython.Char[s[i]]]}[s] each .qython.arange[count[s]];
        :sum[digits]
       ]
      ]
    };
order_by_points:{[nums]
    "
    Sort integers by sum of their digits.
    Maintain original order for equal sums (stable sort).
    ";
    if[count[nums] = 0;
        :()
        ];
    indices:{[i] i} each .qython.arange[count[nums]];
    digit_sums:{[digit_sum;nums;i] digit_sum[nums[i]]}[digit_sum;nums] each .qython.arange[count[nums]];
    pairs:{[digit_sums;indices;nums;i] (digit_sums[i];indices[i];nums[i])}[digit_sums;indices;nums] each .qython.arange[count[nums]];
    sorted_pairs:asc[pairs];
    result:{[pair] pair[2]} each sorted_pairs;
    :result
    }
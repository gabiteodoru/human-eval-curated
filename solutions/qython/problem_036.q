count_sevens:{[num]
    "Count how many times digit 7 appears in a number";
    num_str:.qython.String[.qython.str[num]];
    sevens:{[c] c~"7"} each num_str;
    :sum[sevens]
    };
fizz_buzz:{[n]
    "Return the number of times the digit 7 appears in integers less than n which are divisible by 11 or 13.";
    numbers:.qython.arange[n];
    divisible_by_11_or_13:((numbers mod 11) = 0)|(numbers mod 13) = 0;
    filtered_numbers:numbers[where[divisible_by_11_or_13]];
    seven_counts:{[count_sevens;num] count_sevens[num]}[count_sevens] each filtered_numbers;
    :sum[seven_counts]
    }
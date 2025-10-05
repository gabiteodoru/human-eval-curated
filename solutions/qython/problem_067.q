extract_number:{[word]
    "Try to convert a word to int, return 0 if it fails";
    if[count[word] = 0;
        :0
        ];
    is_digit_array:{[char] char within ("0";"9")} each word;
    $[all[is_digit_array];
        :.qython.int[word];
        :0
      ]
    };
fruit_distribution:{[s;n]
    "
    Extract numbers from string s and subtract from n to get mangos
    ";
    words:.qython.split[" "; s];
    numbers:{[extract_number;word] extract_number[word]}[extract_number] each words;
    result:n-sum[numbers];
    :result
    }
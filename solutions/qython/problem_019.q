sort_numbers:{[numbers]
    word_to_num:(`zero;`one;`two;`three;`four;`five;`six;`seven;`eight;`nine)!(0;1;2;3;4;5;6;7;8;9);
    words:.qython.split[" "; numbers];
    if[count[words] = 0;
        :""
        ];
    nums:{[word_to_num;w] word_to_num[.qython.str[w]]}[word_to_num] each words;
    sorted_indices:iasc[nums];
    sorted_words:{[words;i] words[i]}[words] each sorted_indices;
    result:.qython.join[enlist[" "]; sorted_words];
    :result
    }
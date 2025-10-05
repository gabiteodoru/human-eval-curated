histogram:{[test]
    "Given a string representing a space separated lowercase letters, return a dictionary
    of the letter with the most repetition and containing the corresponding count.
    If several letters have the same occurrence, return all of them.
    ";
    if[test~"";
        :()!()
        ];
    words:.qython.split[" "; test];
    unique_words:distinct[words];
    count_occurrences:{[words;word]
        matches:{[word;w] w~word}[word] each words;
        :sum[matches]
        }[words];
    counts:{[count_occurrences;w] count_occurrences[w]}[count_occurrences] each unique_words;
    max_count:max[counts];
    result:()!();
    i:0;
    while[i < count[unique_words];
        if[counts[i] = max_count;
            result[unique_words[i]]:counts[i]
            ];
        i+:1
        ];
    :result
    }
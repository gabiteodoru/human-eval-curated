select_words:{[s;n]
    if[count[s] = 0;
        :()
        ];
    words:.qython.split[" "; s];
    count_consonants:{[word]
        vowels:"aeiouAEIOU";
        consonant_mask:{[vowels;char] not char qin vowels}[vowels] each word;
        :sum[consonant_mask]
        };
    result:{[word] word} each words where {[count_consonants;n;word] count_consonants[word] = n}[count_consonants;n] each words;
    :result
    }
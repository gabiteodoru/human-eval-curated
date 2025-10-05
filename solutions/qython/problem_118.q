is_vowel:{[c]
    vowels:"aeiouAEIOU";
    :any[vowels = c]
    };
get_closest_vowel:{[word]
    if[count[word] < 3;
        :""
        ];
    i:count[word]-2;
    while[i >= 1;
        current:word[i];
        left:word[i-1];
        right:word[i+1];
        if[(is_vowel[current] and not is_vowel[left]) and not is_vowel[right];
            result:"";
            result:raze[(result;enlist current)];
            :result
            ];
        i-:1
        ];
    :""
    }
is_prime:{[n]
    "Check if a number is prime";
    if[n < 2;
        :0b
        ];
    if[n = 2;
        :1b
        ];
    if[(n mod 2) = 0;
        :0b
        ];
    i:3;
    while[(i*i) <= n;
        if[(n mod i) = 0;
            :0b
            ];
        i+:2
        ];
    :1b
    };
words_in_sentence:{[sentence]
    "
    You are given a string representing a sentence,
    the sentence contains some words separated by a space,
    and you have to return a string that contains the words from the original sentence,
    whose lengths are prime numbers,
    the order of the words in the new string should be the same as the original one.

    Example 1:
        Input: sentence = String(\"This is a test\")
        Output: String(\"is\")

    Example 2:
        Input: sentence = String(\"lets go for swimming\")
        Output: String(\"go for\")

    Constraints:
        * 1 <= len(sentence) <= 100
        * sentence contains only letters
    ";
    words:.qython.split[" "; sentence];
    prime_words:{[word] word} each words where {[is_prime;word] is_prime[count[word]]}[is_prime] each words;
    result:.qython.join[enlist[" "]; prime_words];
    :result
    }
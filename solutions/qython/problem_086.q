anti_shuffle:{[s]
    "
    Write a function that takes a string and returns an ordered version of it.
    Ordered version of string, is a string where all words (separated by space)
    are replaced by a new word where all the characters arranged in
    ascending order based on ascii value.
    Note: You should keep the order of words and blank spaces in the sentence.
    ";
    sort_word_chars:{[word]
        "Sort characters in a word by ASCII value";
        chars:{[c] c} each word;
        ascii_vals:{[c] .qython.ord[c]} each chars;
        sorted_indices:iasc[ascii_vals];
        sorted_chars:{[chars;i] chars[i]}[chars] each sorted_indices;
        :.qython.join[""; sorted_chars]
        };
    words:.qython.split[enlist[" "]; s];
    sorted_words:{[sort_word_chars;word] sort_word_chars[word]}[sort_word_chars] each words;
    :.qython.join[enlist[" "]; sorted_words]
    }
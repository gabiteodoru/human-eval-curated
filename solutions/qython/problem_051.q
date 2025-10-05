remove_vowels:{[text]
    vowels:"aeiouAEIOU";
    result:{[char] char} each text where {[vowels;char] not char qin vowels}[vowels] each text;
    :.qython.join[""; result]
    }
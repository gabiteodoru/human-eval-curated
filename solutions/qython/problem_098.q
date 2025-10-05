count_upper:{[s]
    "
    Given a string s, count the number of uppercase vowels in even indices.

    For example:
    count_upper(String('aBCdEf')) returns 1
    count_upper(String('abcdefg')) returns 0
    count_upper(String('dBBE')) returns 0
    ";
    uppercase_vowels:("A";"E";"I";"O";"U");
    even_indices:.qython.arange[0;count[s];2];
    chars_at_even:{[s;i] s[i]}[s] each even_indices;
    is_vowel:{[uppercase_vowels;char] char qin uppercase_vowels}[uppercase_vowels] each chars_at_even;
    :sum[is_vowel]
    }
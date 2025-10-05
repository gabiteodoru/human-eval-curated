encode:{[message]
    text:message;
    result:message;
    vowels_lower:("a";"e";"i";"o";"u");
    vowels_upper:("A";"E";"I";"O";"U");
    replacements_lower:("C";"G";"K";"Q";"W");
    replacements_upper:("c";"g";"k";"q";"w");
    uppercase_letters:.qython.String[.Q.A];
    n:count[text];
    i:0;
    while[i < n;
        char:text[i];
        $[char~(" ");
            result[i]:char;
          char qin vowels_lower;
           [
            idx:.qython.index[vowels_lower;char];
            result[i]:replacements_lower[idx]
           ];
          char qin vowels_upper;
           [
            idx:.qython.index[vowels_upper;char];
            result[i]:replacements_upper[idx]
           ];
          char qin uppercase_letters;
            result[i]:lower[char];
            result[i]:upper[char]
          ];
        i+:1
        ];
    :result
    }
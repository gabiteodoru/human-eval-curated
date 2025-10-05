decode_shift:{[s]
    "
    takes as input string encoded with encode_shift function. Returns decoded string.
    ";
    text:.qython.String[s];
    char_codes:{[ch] .qython.ord[ch]} each text;
    decoded_codes:{[code] (((code-.qython.ord["a"])-5) mod 26)+.qython.ord["a"]} each char_codes;
    decoded_chars:{[code] .qython.Char[.qython.chr[code]]} each decoded_codes;
    :.qython.join[""; decoded_chars]
    }
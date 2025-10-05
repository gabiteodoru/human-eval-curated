encrypt:{[s]
    "Encrypt a string using Caesar cipher with shift of 4.";
    alphabet:"abcdefghijklmnopqrstuvwxyz";
    shifted:{[alphabet;c] (alphabet[((.qython.ord[c]-.qython.ord["a"])+4) mod 26])}[alphabet] each s;
    :.qython.join[""; shifted]
    }
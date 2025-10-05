is_palindrome:{[num]
    s:.qython.String[.qython.str[num]];
    :s~reverse[s]
    };
even_odd_palindrome:{[n]
    numbers:.qython.arange[1;n+1];
    palindrome_mask:{[is_palindrome;num] is_palindrome[num]}[is_palindrome] each numbers;
    palindromes:numbers[where[palindrome_mask]];
    even_palindromes:palindromes[where[(palindromes mod 2) = 0]];
    odd_palindromes:palindromes[where[(palindromes mod 2) = 1]];
    :(count[even_palindromes];count[odd_palindromes])
    }
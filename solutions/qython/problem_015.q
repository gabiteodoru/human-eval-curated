string_sequence:{[n]
    " Return a string containing space-delimited numbers starting from 0 upto n inclusive.
    >>> string_sequence(0)
    String('0')
    >>> string_sequence(5)
    String('0 1 2 3 4 5')
    ";
    nums:.qython.arange[n+1];
    str_nums:{[num] .qython.str[num]} each nums;
    result:.qython.join[enlist[" "]; str_nums];
    :result
    }
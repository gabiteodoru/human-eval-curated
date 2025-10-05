string_xor:{[a;b]
    " Input are two strings a and b consisting only of 1s and 0s.
    Perform binary XOR on these inputs and return result also as a string.
    >>> string_xor(String('010'), String('110'))
    String('100')
    ";
    a_ints:{[c] .qython.int[.qython.Char[c]]} each a;
    b_ints:{[c] .qython.int[.qython.Char[c]]} each b;
    xor_result:(a_ints+b_ints) mod 2;
    result_chars:{[x] .qython.Char[.qython.str[.qython.int[x]]]} each xor_result;
    :.qython.join[""; result_chars]
    }
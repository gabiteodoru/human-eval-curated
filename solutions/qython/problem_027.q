flip_case:{[s]
    " For a given string, flip lowercase characters to uppercase and uppercase to lowercase.
    >>> flip_case(String('Hello'))
    String('hELLO')
    ";
    result:{[c] $[c qin .Q.a;.qython.Char[upper[c]];.qython.Char[lower[c]]]} each s;
    :.qython.join[""; result]
    }
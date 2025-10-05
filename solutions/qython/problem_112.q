reverse_delete:{[s;c]
    result:.qython.join[""; {[char] char} each s where {[c;char] not char qin c}[c] each s];
    is_palindrome:result~reverse[result];
    :(result;is_palindrome)
    }
is_palindrome:{[text]
    "Test if given string is a palindrome";
    :text~reverse[text]
    };
make_palindrome:{[text]
    "Find the shortest palindrome that begins with a supplied string.
    Algorithm idea is simple:
    - Find the longest postfix of supplied string that is a palindrome.
    - Append to the end of the string reverse of a string prefix that comes before the palindromic suffix.
    ";
    if[count[text] = 0;
        :text
        ];
    i:0;
    while[i < count[text];
        suffix:.qython.slice[text;i;0N;0N];
        if[is_palindrome[suffix];
            prefix:.qython.slice[text;0N;i;0N];
            :raze[(text;reverse[prefix])]
            ];
        i+:1
        ];
    :text
    }
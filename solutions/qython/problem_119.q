is_balanced:{[s]
    "Check if a string of parentheses is balanced";
    balance:0;
    i:0;
    while[i < count[s];
        $[s[i]~"(";
            balance+:1;
            balance-:1
          ];
        if[balance < 0;
            :0b
            ];
        i+:1
        ];
    :balance = 0
    };
match_parens:{[lst]
    "Check if we can concatenate two strings to make balanced parentheses";
    s1:raze[(lst[0];lst[1])];
    if[is_balanced[s1];
        :"Yes"
        ];
    s2:raze[(lst[1];lst[0])];
    if[is_balanced[s2];
        :"Yes"
        ];
    :"No"
    }
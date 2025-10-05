vowels_count:{[s]
    "Count vowels in string. 'y' counts only at the end.";
    vowels:"aeiouAEIOU";
    total:sum[{[vowels;c] .qython.Char[c] qin vowels}[vowels] each s];
    if[count[s] > 0;
        last_char:s[count[s]-1];
        if[(last_char~"y") or last_char~"Y";
            total+:1
            ]
        ];
    :total
    }
check_if_last_char_is_a_letter:{[txt]
    if[count[txt] = 0;
        :0b
        ];
    last_char:txt[count[txt]-1];
    is_alpha:((last_char >= "a") and last_char <= "z") or (last_char >= "A") and last_char <= "Z";
    if[not is_alpha;
        :0b
        ];
    if[count[txt] = 1;
        :1b
        ];
    prev_char:txt[count[txt]-2];
    :prev_char~(" ")
    }
normalize_delimiters:{[S]
    replace_char:{[c]
        $[(c~"?") or c~"!";
            :".";
            :c
          ]
        };
    :replace_char each S
    };
starts_with_i:{[sentence]
    stripped:trim[sentence];
    if[count[stripped] > 0;
        first_char:stripped[0];
        is_i:first_char~"I";
        if[is_i;
            $[count[stripped] = 1;
                :1;
               [
                second_char:stripped[1];
                is_space:second_char~(" ");
                if[is_space;
                    :1
                    ]
               ]
              ]
            ]
        ];
    :0
    };
is_bored:{[S]
    text:normalize_delimiters[S];
    sentences:.qython.split[enlist["."]; text];
    boredom_counts:starts_with_i each sentences;
    :sum[boredom_counts]
    }
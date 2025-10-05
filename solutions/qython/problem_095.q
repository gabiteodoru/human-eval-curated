check_dict_case:{[d]
    if[count[d]~0;
        :0b
        ];
    keys_list:key[d];
    is_string_checks:{[k] .qython.type[k]~`Char} each keys_list;
    all_strings:all[is_string_checks];
    if[not all_strings;
        :0b
        ];
    key_strings:{[k] .qython.String[k]} each keys_list;
    is_lower:{[k] k~lower[k]} each key_strings;
    is_upper:{[k] k~upper[k]} each key_strings;
    all_lower:all[is_lower];
    all_upper:all[is_upper];
    :all_lower or all_upper
    }
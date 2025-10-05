file_name_check:{[file_name]
    fname:$[.qython.isinstance[file_name;.qython.str];.qython.String[file_name];file_name];
    dot_count:sum[{[c] c~"."} each fname];
    if[dot_count <> 1;
        :"No"
        ];
    parts:.qython.split[enlist["."]; fname];
    name_part:parts[0];
    ext_part:parts[1];
    if[count[name_part] = 0;
        :"No"
        ];
    first_char:name_part[0];
    is_letter:((.qython.ord[first_char] >= .qython.ord["a"]) and .qython.ord[first_char] <= .qython.ord["z"]) or (.qython.ord[first_char] >= .qython.ord["A"]) and .qython.ord[first_char] <= .qython.ord["Z"];
    if[not is_letter;
        :"No"
        ];
    digit_count:sum[{[c] c within ("0";"9")} each fname];
    if[digit_count > 3;
        :"No"
        ];
    valid_exts:("txt";"exe";"dll");
    ext_valid:any[{[ext_part;ext] ext_part~ext}[ext_part] each valid_exts];
    if[not ext_valid;
        :"No"
        ];
    :"Yes"
    }
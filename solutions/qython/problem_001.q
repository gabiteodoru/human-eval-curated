separate_paren_groups:{[paren_string]
    cleaned:.qython.replace[paren_string; enlist[" "]; ""];
    groups:();
    current_group:"";
    depth:0;
    i:0;
    while[i < count[cleaned];
        char:cleaned[i];
        current_group:raze[(current_group;enlist char)];
        $[char~"(";
            depth+:1;
            depth-:1
          ];
        if[depth = 0;
            groups:raze[(groups;enlist current_group)];
            current_group:""
            ];
        i+:1
        ];
    :groups
    }
all_prefixes:{[s]
    "Return list of all prefixes from shortest to longest of the input string";
    result:();
    i:1;
    while[i <= count[s];
        result:raze[(result;enlist .qython.slice[s;0N;i;0N])];
        i+:1
        ];
    :result
    }
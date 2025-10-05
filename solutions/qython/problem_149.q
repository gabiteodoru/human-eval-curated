sorted_list_sum:{[lst]
    even_length:{[s] s} each lst where {[s] (count[s] mod 2) = 0} each lst;
    if[count[even_length] = 0;
        :()
        ];
    lengths:{[s] count[s]} each even_length;
    sorted_indices:iasc[lengths];
    result:{[even_length;i] even_length[i]}[even_length] each sorted_indices;
    final_result:();
    i:0;
    while[i < count[result];
        current_len:count[result[i]];
        same_len_group:();
        j:i;
        while[(j < count[result]) and count[result[j]] = current_len;
            same_len_group:raze[(same_len_group;enlist result[j])];
            j+:1
            ];
        sorted_group:asc[same_len_group];
        final_result:raze[(final_result;sorted_group)];
        i:j
        ];
    :final_result
    }
get_row:{[lst;x]
    result:();
    i:0;
    while[i < count[lst];
        row:lst[i];
        matches:where[row = x];
        j:0;
        while[j < count[matches];
            col_idx:matches[j];
            result:raze[(result;enlist (i;col_idx))];
            j+:1
            ];
        i+:1
        ];
    if[count[result] = 0;
        :result
        ];
    result_array:result;
    row_vals:result_array[;0];
    col_vals:result_array[;1];
    sort_indices:iasc[(row_vals*1000)-col_vals];
    sorted_result:{[result;idx] result[idx]}[result] each sort_indices;
    :sorted_result
    }
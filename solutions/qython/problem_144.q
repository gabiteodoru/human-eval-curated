simplify:{[x;n]
    x_parts:.qython.split[enlist["/"]; x];
    x_num:.qython.int[x_parts[0]];
    x_den:.qython.int[x_parts[1]];
    n_parts:.qython.split[enlist["/"]; n];
    n_num:.qython.int[n_parts[0]];
    n_den:.qython.int[n_parts[1]];
    result_num:x_num*n_num;
    result_den:x_den*n_den;
    :(result_num mod result_den) = 0
    }
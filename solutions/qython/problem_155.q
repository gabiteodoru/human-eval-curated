even_odd_count:{[num]
    num_abs:abs[num];
    digits_str:.qython.String[.qython.str[num_abs]];
    digits:{[d] .qython.int[d]} each digits_str;
    even_count:.qython.int[sum[{[d] (d mod 2) = 0} each digits]];
    odd_count:.qython.int[sum[{[d] (d mod 2) = 1} each digits]];
    :(even_count;odd_count)
    }
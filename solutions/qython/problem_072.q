will_it_fly:{[q;w]
    is_palindrome:q~reverse[q];
    total_weight:sum[q];
    :is_palindrome and total_weight <= w
    }
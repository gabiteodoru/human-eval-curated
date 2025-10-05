generate_integers:{[a;b]
    "
    Given two positive integers a and b, return the single-digit even numbers in the
    closed interval [min(a,b), max(a,b)] (including endpoints), in ascending order.
    ";
    min_val:$[a < b;a;b];
    max_val:$[a > b;a;b];
    single_digit_evens:(0;2;4;6;8);
    result:{[x] x} each single_digit_evens where {[min_val;max_val;x] (x >= min_val) and x <= max_val}[min_val;max_val] each single_digit_evens;
    :result
    }
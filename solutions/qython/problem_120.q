maximum:{[arr;k]
    "
    Given an array arr of integers and a positive integer k, return a sorted list
    of length k with the maximum k numbers in arr.
    ";
    sorted_arr:asc[arr];
    top_k:.qython.slice[sorted_arr;count[sorted_arr]-k;0N;0N];
    :top_k
    }
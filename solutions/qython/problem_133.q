sum_squares:{[lst]
    "Sum of squared numbers, rounding each element up first (ceiling).";
    ceiled:ceiling[lst];
    squared:ceiled*ceiled;
    :sum[squared]
    }
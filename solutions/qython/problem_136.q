largest_smallest_integers:{[lst]
    arr:lst;
    negatives:arr[where[arr < 0]];
    positives:arr[where[arr > 0]];
    largest_neg:$[count[negatives] > 0;max[negatives];(::)];
    smallest_pos:$[count[positives] > 0;min[positives];(::)];
    :(largest_neg;smallest_pos)
    }
/ np.array() is unnecessary in Qython - all lists are automatically numpy arrays. Use the argument directly.
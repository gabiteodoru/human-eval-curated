find_closest_elements:{[numbers]
    " From a supplied list of numbers (of length at least two) select and return two that are the closest to each
    other and return them in order (smaller number, larger number).
    ";
    sorted_nums:asc[numbers];
    diffs:.qython.diff[sorted_nums];
    min_idx:iasc[diffs][0];
    :(sorted_nums[min_idx];sorted_nums[min_idx+1])
    }
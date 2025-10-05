remove_duplicates:{[numbers]
    " From a list of integers, remove all elements that occur more than once.
    Keep order of elements left the same as in the input.
    ";
    unique_nums:distinct[numbers];
    counts:{[numbers;num] (sum[numbers = num])}[numbers] each unique_nums;
    nums_to_keep:{[unique_nums;i] unique_nums[i]}[unique_nums] each .qython.arange[count[unique_nums]] where {[counts;i] counts[i] = 1}[counts] each .qython.arange[count[unique_nums]];
    result:{[num] num} each numbers where {[nums_to_keep;num] num qin nums_to_keep}[nums_to_keep] each numbers;
    :result
    }
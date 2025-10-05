minSubArraySum:{[nums]
    "
    Given an array of integers nums, find the minimum sum of any non-empty sub-array
    of nums.
    ";
    min_ending_here:nums[0];
    min_so_far:nums[0];
    i:1;
    while[i < count[nums];
        candidate:min_ending_here+nums[i];
        min_ending_here:$[nums[i] < candidate;nums[i];candidate];
        min_so_far:$[min_ending_here < min_so_far;min_ending_here;min_so_far];
        i+:1
        ];
    :min_so_far
    }
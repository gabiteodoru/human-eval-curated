monotonic:{[l]
    "Return True is list elements are monotonically increasing or decreasing.";
    if[count[l] <= 1;
        :1b
        ];
    diffs:.qython.diff[l];
    is_increasing:all[diffs >= 0];
    is_decreasing:all[diffs <= 0];
    :is_increasing or is_decreasing
    }
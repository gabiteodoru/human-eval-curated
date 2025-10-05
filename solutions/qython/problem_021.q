rescale_to_unit:{[numbers]
    min_val:min[numbers];
    max_val:max[numbers];
    :(numbers-min_val)%max_val-min_val
    }
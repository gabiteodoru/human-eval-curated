mean_absolute_deviation:{[numbers]
    mean_val:avg[numbers];
    deviations:abs[numbers-mean_val];
    :avg[deviations]
    }
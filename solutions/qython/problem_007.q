filter_by_substring:{[strings;substr]
    "Filter strings that contain the given substring";
    result:{[s] s} each strings where {[substr;s] substr qin s}[substr] each strings;
    :result
    }
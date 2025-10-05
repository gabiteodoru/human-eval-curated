filter_by_prefix:{[strings;prefix]
    if[count[strings] = 0;
        :()
        ];
    prefix_len:count[prefix];
    result:{[s] s} each strings where {[prefix_len;prefix;s] (count[s] >= prefix_len) and (.qython.slice[s;0N;prefix_len;0N])~prefix}[prefix_len;prefix] each strings;
    :result
    }
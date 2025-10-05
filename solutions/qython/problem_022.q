filter_integers:{[values]
    "Filter given list of any python values only for integers";
    result:{[x] x} each values where {[x] .qython.isinstance[x;.qython.int]} each values;
    :result
    }
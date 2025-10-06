filter_by_prefix:{[strings;prefix] strings where (count[prefix]<=count each strings) and {x~y}'[count[prefix]#'strings;count[strings]#enlist prefix]}

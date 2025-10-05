decode_cyclic:{[s]
    "
    takes as input string encoded with encode_cyclic function. Returns decoded string.
    ";
    groups:{[s;i] .qython.slice[s;3*i;min[((3*i)+3;count[s])];0N]}[s] each (.qython.arange[(count[s]+2) div 3]);
    groups:{[grp] $[count[grp] = 3;(raze[(2 _ grp;2 sublist grp)]);grp]} each groups;
    :.qython.join[""; groups]
    }
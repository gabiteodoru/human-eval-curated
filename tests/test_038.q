candidate: decode_cyclic;

check:{[candidate]
    encode_cyclic:{[s]
        "
        returns encoded string by cycling groups of three characters.
        ";
        groups:{[s;i] .qython.slice[s;3*i;min[((3*i)+3;count[s])];0N]}[s] each (.qython.arange[(count[s]+2) div 3]);
        groups:{[grp] $[count[grp] = 3;(raze[(1 _ grp;grp[0])]);grp]} each groups;
        :.qython.join[""; groups]
        };
    system["S ",.qython.String 42];
    letters:.Q.a;
    do[100;
        s:.qython.join[""; {[letters;i] rand[letters]}[letters] each .qython.arange[.qython.randint[10;21]]];
        encoded_str:encode_cyclic[s];
        .qython.assert[candidate[encoded_str] = s]
        ]
    }
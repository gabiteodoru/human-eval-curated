bf:{[planet1;planet2]
    planets_list:("Mercury";"Venus";"Earth";"Mars";"Jupiter";"Saturn";"Uranus";"Neptune");
    planet1_found:0b;
    planet2_found:0b;
    idx1:-1;
    idx2:-1;
    i:0;
    while[i < count[planets_list];
        if[planets_list[i]~planet1;
            planet1_found:1b;
            idx1:i
            ];
        if[planets_list[i]~planet2;
            planet2_found:1b;
            idx2:i
            ];
        i+:1
        ];
    if[(not planet1_found) or not planet2_found;
        :()
        ];
    min_idx:$[idx1 < idx2;idx1;idx2];
    max_idx:$[idx1 < idx2;idx2;idx1];
    between:.qython.slice[planets_list;min_idx+1;max_idx;0N];
    :between
    }
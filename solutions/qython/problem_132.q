is_nested:{[s]
    n:count[s];
    opening_count:0;
    max_opening:0;
    i:0;
    while[i < n;
        $[s[i]~"[";
           [
            opening_count+:1;
            if[opening_count > max_opening;
                max_opening:opening_count
                ]
           ];
            opening_count-:1
          ];
        i+:1
        ];
    closing_count:0;
    max_closing:0;
    i:n-1;
    while[i >= 0;
        $[s[i]~"]";
           [
            closing_count+:1;
            if[closing_count > max_closing;
                max_closing:closing_count
                ]
           ];
           [
            closing_count-:1;
            if[closing_count < 0;
                closing_count:0
                ]
           ]
          ];
        i-:1
        ];
    :(max_opening >= 2) and max_closing >= 2
    }
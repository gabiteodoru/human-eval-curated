int_to_mini_roman:{[number]
    "
    Convert a positive integer to lowercase Roman numeral string.
    Restrictions: 1 <= number <= 1000
    ";
    values:(1000;900;500;400;100;90;50;40;10;9;5;4;1);
    numerals:(enlist["m"];"cm";enlist["d"];"cd";enlist["c"];"xc";enlist["l"];"xl";enlist["x"];"ix";enlist["v"];"iv";enlist["i"]);
    result:"";
    remaining:number;
    i:0;
    while[i < count[values];
        val:values[i];
        numeral:numerals[i];
        while[remaining >= val;
            result:raze[(result;numeral)];
            remaining-:val
            ];
        i+:1
        ];
    :result
    }
valid_date:{[date_str]
    "Validate a date string in mm-dd-yyyy format";
    if[count[date_str] = 0;
        :0b
        ];
    parts:.qython.split[enlist["-"]; date_str];
    if[count[parts] <> 3;
        :0b
        ];
    month_str:.qython.str[parts[0]];
    day_str:.qython.str[parts[1]];
    year_str:.qython.str[parts[2]];
    if[((count[month_str] = 0) or count[day_str] = 0) or count[year_str] = 0;
        :0b
        ];
    if[(day_str~enlist["0"]) or month_str~enlist["0"];
        :0b
        ];
    month:.qython.int[month_str];
    day:.qython.int[day_str];
    year:.qython.int[year_str];
    if[(month < 1) or month > 12;
        :0b
        ];
    $[month qin (1;3;5;7;8;10;12);
        max_days:31;
      month qin (4;6;9;11);
        max_days:30;
        max_days:29
      ];
    if[(day < 1) or day > max_days;
        :0b
        ];
    :1b
    }
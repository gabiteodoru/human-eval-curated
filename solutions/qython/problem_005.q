intersperse:{[numbers;delimeter]
    if[count[numbers] <= 1;
        :numbers
        ];
    result:();
    i:0;
    while[i < count[numbers]-1;
        result:raze[(result;(numbers[i];delimeter))];
        i+:1
        ];
    result:raze[(result;enlist numbers[count[numbers]-1])];
    :result
    }
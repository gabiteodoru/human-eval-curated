fix_spaces:{[text]
    "
    Given a string text, replace all spaces in it with underscores,
    and if a string has more than 2 consecutive spaces,
    then replace all consecutive spaces with -
    ";
    result:"";
    i:0;
    while[i < count[text];
        $[text[i]~(" ");
           [
            space_count:0;
            j:i;
            while[(j < count[text]) and text[j]~(" ");
                space_count+:1;
                j+:1
                ];
            $[space_count = 1;
                result:raze[(result;enlist "_")];
              space_count = 2;
                result:raze[(result;("_";"_"))];
                result:raze[(result;enlist "-")]
              ];
            i:j
           ];
           [
            result:raze[(result;enlist text[i])];
            i+:1
           ]
          ]
        ];
    :result
    }
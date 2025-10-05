by_length:{[arr]
    digit_map:(1;2;3;4;5;6;7;8;9)!("One";"Two";"Three";"Four";"Five";"Six";"Seven";"Eight";"Nine");
    filtered:{[x] x} each arr where {[x] (x >= 1) and x <= 9} each arr;
    sorted_arr:asc[filtered];
    reversed_arr:reverse[sorted_arr];
    result:{[digit_map;x] digit_map[x]}[digit_map] each reversed_arr;
    :result
    }
solution:{[lst]
    "Given a non-empty list of integers, return the sum of all of the odd elements that are in even positions.";
    even_positions:.qython.slice[lst;0N;0N;2];
    odd_mask:(even_positions mod 2) <> 0;
    odd_at_even_pos:even_positions[where[odd_mask]];
    :sum[odd_at_even_pos]
    }
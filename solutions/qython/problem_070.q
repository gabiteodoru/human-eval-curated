strange_sort_list:{[lst]
    if[count[lst] = 0;
        :()
        ];
    result:();
    remaining:asc[lst];
    use_min:1b;
    while[count[remaining] > 0;
        $[use_min;
           [
            val:remaining[0];
            remaining:1 _ remaining
           ];
           [
            val:remaining[count[remaining]-1];
            remaining:.qython.slice[remaining;0N;count[remaining]-1;0N]
           ]
          ];
        result:raze[(result;enlist val)];
        use_min:not use_min
        ];
    :result
    }
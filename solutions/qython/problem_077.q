iscube:{[a]
    if[a = 0;
        :1b
        ];
    abs_a:abs[a];
    cube_root:abs_a xexp 1%3;
    cube_root_rounded:.qython.round[cube_root];
    :(cube_root_rounded xexp 3) = abs_a
    }
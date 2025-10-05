eat:{[number;need;remaining]
    can_eat:$[need < remaining;need;remaining];
    total_eaten:number+can_eat;
    remaining_after:remaining-can_eat;
    :(total_eaten;remaining_after)
    }
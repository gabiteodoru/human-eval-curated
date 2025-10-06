is_sorted: {[lst] lst: $[0 > type lst; enlist lst; lst]; (lst ~ asc lst) and not any (count each group lst) > 2}

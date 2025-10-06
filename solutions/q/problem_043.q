pairs_sum_to_zero: {[l] if[2>count l; :0b]; any {[lst;i] any (neg lst[i])=lst where (til count lst)<>i}[l;] each til count l };

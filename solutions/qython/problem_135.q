can_arrange:{[arr]
    "Find the largest index i where arr[i] < arr[i-1], or -1 if no such index exists.";
    if[count[arr] <= 1;
        :-1
        ];
    comparisons:(1 _ arr) < .qython.slice[arr;0N;count[arr]-1;0N];
    indices:where[comparisons];
    if[count[indices] = 0;
        :-1
        ];
    :.qython.int[({$[0<=i:count[x]-1;x i;'length]}indices)+1]
    }
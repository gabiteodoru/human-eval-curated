prod_signs:{[arr]
    "
    You are given an array arr of integers and you need to return
    sum of magnitudes of integers multiplied by product of all signs
    of each number in the array, represented by 1, -1 or 0.
    Note: return None for empty arr.

    Example:
    >>> prod_signs([1, 2, 2, -4]) == -9
    >>> prod_signs([0, 1]) == 0
    >>> prod_signs([]) == None
    ";
    if[count[arr] = 0;
        :(::)
        ];
    if[any[arr = 0];
        :0
        ];
    sum_magnitudes:sum[abs[arr]];
    signs:signum[arr];
    product_of_signs:prd[signs];
    :.qython.int[sum_magnitudes*product_of_signs]
    }
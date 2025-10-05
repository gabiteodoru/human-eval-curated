minPath:{[grid;k]
    n:count[grid];
    flat_grid:raze[grid];
    idx_of_1:.qython.index[flat_grid;1];
    i1:idx_of_1 div n;
    j1:idx_of_1 mod n;
    neighbors:();
    if[i1 > 0;
        neighbors:raze[(neighbors;enlist flat_grid[((i1-1)*n)+j1])]
        ];
    if[i1 < n-1;
        neighbors:raze[(neighbors;enlist flat_grid[((i1+1)*n)+j1])]
        ];
    if[j1 > 0;
        neighbors:raze[(neighbors;enlist flat_grid[(i1*n)+j1-1])]
        ];
    if[j1 < n-1;
        neighbors:raze[(neighbors;enlist flat_grid[(i1*n)+j1+1])]
        ];
    min_neighbor:.qython.int[min[neighbors]];
    result:();
    idx:0;
    while[idx < k;
        $[(idx mod 2) = 0;
            result:raze[(result;enlist 1)];
            result:raze[(result;enlist min_neighbor)]
          ];
        idx+:1
        ];
    :{[x] .qython.int[x]} each result
    }
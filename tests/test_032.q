candidate: find_zero;

check:{[candidate]
    system["S ",.qython.String 42];
    do[100;
        ncoeff:2*.qython.randint[1;5];
        coeffs:();
        do[ncoeff;
            coeff:.qython.randint[-10;11];
            if[coeff = 0;
                coeff:1
                ];
            coeffs,:coeff
            ];
        solution:candidate[coeffs];
        .qython.assert[abs[poly[coeffs;solution]] < 1e-4]
        ]
    }
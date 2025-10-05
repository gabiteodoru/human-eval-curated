concatenate:{[strings]
    " Concatenate list of strings into a single string ";
    if[count[strings] = 0;
        :""
        ];
    :.qython.join[""; strings]
    }
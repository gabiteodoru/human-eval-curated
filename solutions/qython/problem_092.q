any_int:{[x;y;z]
    if[not (.qython.isinstance[x;.qython.int] and .qython.isinstance[y;.qython.int]) and .qython.isinstance[z;.qython.int];
        :0b
        ];
    if[x = y+z;
        :1b
        ];
    if[y = x+z;
        :1b
        ];
    if[z = x+y;
        :1b
        ];
    :0b
    }
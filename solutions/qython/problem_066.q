digitSum:{[s]
    "Sum ASCII codes of uppercase characters only";
    text:$[.qython.isinstance[s;.qython.str];.qython.String[s];s];
    if[count[text] = 0;
        :0
        ];
    ascii_values:{[c] $[(c >= "A") and c <= "Z";.qython.ord[c];0]} each text;
    :sum[ascii_values]
    }
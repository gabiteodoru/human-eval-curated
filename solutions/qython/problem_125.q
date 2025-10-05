split_words:{[txt]
    has_whitespace:any[{[c] c~(" ")} each txt];
    if[has_whitespace;
        :.qython.split[" "; txt]
        ];
    has_comma:any[{[c] c~","} each txt];
    if[has_comma;
        :.qython.split[enlist[","]; txt]
        ];
    lowercase_chars:.qython.String[.Q.a];
    is_lower:{[lowercase_chars;c] c qin lowercase_chars}[lowercase_chars] each txt;
    positions:{[is_lower;(i;c)] $[is_lower[i];.qython.ord[c]-.qython.ord["a"];0]}[is_lower] each .qython.enumerate[txt];
    is_odd:{[positions;is_lower;i] $[is_lower[i];(positions[i] mod 2) = 1;0b]}[positions;is_lower] each .qython.arange[count[positions]];
    n:sum[is_odd];
    :n
    }
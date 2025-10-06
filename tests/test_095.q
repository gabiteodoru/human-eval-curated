candidate: check_dict_case;

check:{[candidate]
	wrapper:{[candidate;x] @[candidate;x;0b] or @[candidate;({$[10=abs type x;`$x;x]}each key x)!value x;0b]}[check_dict_case];
    .qython.assert2[wrapper[(enlist["p"];enlist["b"])!("pineapple";"banana")] = 1b;"First test error"];
    .qython.assert2[wrapper[(enlist["p"];enlist["A"];enlist["B"])!("pineapple";"banana";"banana")] = 0b;"Second test error"];
    .qython.assert2[wrapper[(enlist["p"];5;enlist["a"])!("pineapple";"banana";"apple")] = 0b;"Third test error"];
    .qython.assert2[wrapper[("Name";"Age";"City")!("John";"36";"Houston")] = 0b;"Fourth test error"];
    .qython.assert2[wrapper[("STATE";"ZIP")!("NC";"12345")] = 1b;"Fifth test error"];
    .qython.assert2[wrapper[("fruit";"taste")!("Orange";"Sweet")] = 1b;"Sixth test error"];
    .qython.assert2[wrapper[()!()] = 0b;"First edge test error"]

    }
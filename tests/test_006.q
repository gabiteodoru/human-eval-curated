candidate: parse_nested_parens;

check:{[candidate]
    .qython.assert[(candidate["(()()) ((())) () ((())()())"]) = (2;3;1;3)];
    .qython.assert[(candidate["() (()) ((())) (((())))"]) = (1;2;3;4)];
    .qython.assert[candidate["(()(())((())))"] = enlist 4]
    }
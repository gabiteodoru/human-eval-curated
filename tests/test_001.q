candidate: separate_paren_groups;

check:{[candidate]
    .qython.assert[(candidate["(()()) ((())) () ((())()())"])~("(()())";"((()))";"()";"((())()())")];
    .qython.assert[(candidate["() (()) ((())) (((())))"])~("()";"(())";"((()))";"(((())))")];
    .qython.assert[candidate["(()(())((())))"]~enlist "(()(())((())))"];
    .qython.assert[(candidate["( ) (( )) (( )( ))"])~("()";"(())";"(()())")]
    }
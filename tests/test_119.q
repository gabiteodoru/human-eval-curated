candidate: match_parens;

check:{[candidate]
    .qython.assert[candidate[("()(";enlist[")"])] = "Yes"];
    .qython.assert[candidate[(enlist[")"];enlist[")"])] = "No"];
    .qython.assert[candidate[("(()(())";"())())")] = "No"];
    .qython.assert[candidate[(")())";"(()()(")] = "Yes"];
    .qython.assert[candidate[("(())))";"(()())((")] = "Yes"];
    .qython.assert[candidate[("()";"())")] = "No"];
    .qython.assert[candidate[("(()(";"()))()")] = "Yes"];
    .qython.assert[candidate[("((((";"((())")] = "No"];
    .qython.assert[candidate[(")(()";"(()(")] = "No"];
    .qython.assert[candidate[(")(";")(")] = "No"];
    .qython.assert[candidate[(enlist["("];enlist[")"])] = "Yes"];
    .qython.assert[candidate[(enlist[")"];enlist["("])] = "Yes"]
    }
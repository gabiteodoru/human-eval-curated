candidate: do_algebra;

check:{[candidate]
    .qython.assert[any (.[candidate;;0] each ((("**";enlist["*"];enlist["+"]);(2;3;4;5));(("**";"*";"+");(2;3;4;5)))) =\: 37];
    .qython.assert[any (.[candidate;;0] each (((enlist["+"];enlist["*"];enlist["-"]);(2;3;4;5));(("+";"*";"-");(2;3;4;5)))) =\: 9];
    .qython.assert2[any (.[candidate;;0] each ((("//";enlist["*"]);(7;3;4));(("//";"*");(7;3;4)))) =\: 8;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
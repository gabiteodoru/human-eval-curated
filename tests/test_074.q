candidate: total_match;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[();()] = ()];
    .qython.assert[candidate[("hi";"admin");("hi";"hi")] = ("hi";"hi")];
    .qython.assert[candidate[("hi";"admin");("hi";"hi";"admin";"project")] = ("hi";"admin")];
    .qython.assert[(candidate[enlist enlist["4"];(enlist["1"];enlist["2"];enlist["3"];enlist["4"];enlist["5"])]) = enlist enlist["4"]];
    .qython.assert[candidate[("hi";"admin");("hI";"Hi")] = ("hI";"Hi")];
    .qython.assert[candidate[("hi";"admin");("hI";"hi";"hi")] = ("hI";"hi";"hi")];
    .qython.assert[candidate[("hi";"admin");("hI";"hi";"hii")] = ("hi";"admin")];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[(candidate[();enlist "this"]) = ()];
    .qython.assert[(candidate[enlist "this";()]) = ()]
    }
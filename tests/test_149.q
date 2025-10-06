candidate: sorted_list_sum;

check:{[candidate]
    .qython.assert[candidate[("aa";enlist["a"];"aaa")] = enlist "aa"];
    .qython.assert[candidate[("school";"AI";"asdf";enlist["b"])] = ("AI";"asdf";"school")];
    .qython.assert[candidate[(enlist["d"];enlist["b"];enlist["c"];enlist["a"])] = ()];
    .qython.assert[candidate[(enlist["d"];"dcba";"abcd";enlist["a"])] = ("abcd";"dcba")];
    .qython.assert[candidate[("AI";"ai";"au")] = ("AI";"ai";"au")];
    .qython.assert[candidate[(enlist["a"];enlist["b"];enlist["b"];enlist["c"];enlist["c"];enlist["a"])] = ()];
    .qython.assert[candidate[("aaaa";"bbbb";"dd";"cc")] = ("cc";"dd";"aaaa";"bbbb")]
    }
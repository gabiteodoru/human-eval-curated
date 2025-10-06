candidate: histogram;

check:{[candidate]
    .qython.assert2[.qython.rstreq[(candidate["a b b a"]) ; ("a";"b")!(2;2)];"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[.qython.rstreq[(candidate["a b c a b"]) ; ("a";"b")!(2;2)];"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[.qython.rstreq[(candidate["a b c d g"]) ; ("a";"b";"c";"d";"g")!(1;1;1;1;1)];"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[.qython.rstreq[(candidate["r t g"]) ; ("r";"t";"g")!(1;1;1)];"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[.qython.rstreq[(candidate["b b b b a"]) ; (enlist "b")!(enlist 4)];"This prints if this assert fails 5 (good for debugging!)"];
    .qython.assert2[.qython.rstreq[(candidate["r t g"]) ; ("r";"t";"g")!(1;1;1)];"This prints if this assert fails 6 (good for debugging!)"];
    .qython.assert2[0=count candidate[""];"This prints if this assert fails 7 (also good for debugging!)"];
    .qython.assert2[.qython.rstreq[candidate[enlist "a"] ; (enlist "a")!(enlist 1)];"This prints if this assert fails 8 (also good for debugging!)"]
    }
/single-char
candidate: words_string;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[(candidate["Hi, my name is John"]) = ("Hi";"my";"name";"is";"John")];
    .qython.assert[(candidate["One, two, three, four, five, six"]) = ("One";"two";"three";"four";"five";"six")];
    .qython.assert[(candidate["Hi, my name"]) = ("Hi";"my";"name")];
    .qython.assert[(candidate["One,, two, three, four, five, six,"]) = ("One";"two";"three";"four";"five";"six")];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[""] = ()];
    .qython.assert[(candidate["ahmed     , gamal"]) = ("ahmed";"gamal")]
    }
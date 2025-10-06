candidate: flip_case;

check:{[candidate]
    .qython.assert[candidate[""] = ""];
    .qython.assert[candidate["Hello!"] = "hELLO!"];
    .qython.assert[(candidate["These violent delights have violent ends"]) = ("tHESE VIOLENT DELIGHTS HAVE VIOLENT ENDS")]
    }
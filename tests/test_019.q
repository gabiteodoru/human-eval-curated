candidate: sort_numbers;

check:{[candidate]
    .qython.assert[candidate[""] = ""];
    .qython.assert[candidate["three"] = "three"];
    .qython.assert[(candidate["three five nine"]) = ("three five nine")];
    .qython.assert[(candidate["five zero four seven nine eight"]) = ("zero four five seven eight nine")];
    .qython.assert[(candidate["six five four three two one zero"]) = ("zero one two three four five six")]
    }
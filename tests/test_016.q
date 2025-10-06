candidate: count_distinct_characters;

check:{[candidate]
    .qython.assert[candidate[""] = 0];
    .qython.assert[candidate["abcde"] = 5];
    .qython.assert[candidate["abcdecadeCADE"] = 5];
    .qython.assert[candidate["aaaaAAAAaaaa"] = 1];
    .qython.assert[(candidate["Jerry jERRY JeRRRY"]) = 5]
    }
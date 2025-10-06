candidate: check_if_last_char_is_a_letter;

check:{[candidate]
    .qython.assert[candidate["apple"] = 0b];
    .qython.assert[(candidate["apple pi e"]) = 1b];
    .qython.assert[candidate["eeeee"] = 0b];
    .qython.assert[candidate[enlist["A"]] = 1b];
    .qython.assert[(candidate["Pumpkin pie "]) = 0b];
    .qython.assert[(candidate["Pumpkin pie 1"]) = 0b];
    .qython.assert[candidate[""] = 0b];
    .qython.assert[(candidate["eeeee e "]) = 0b];
    .qython.assert[(candidate["apple pie"]) = 0b];
    .qython.assert[(candidate["apple pi e "]) = 0b];
    .qython.assert[1b]
    }
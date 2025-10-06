candidate: parse_music;

check:{[candidate]
    .qython.assert[candidate[""] = ()];
    .qython.assert[(candidate["o o o o"]) = (4;4;4;4)];
    .qython.assert[(candidate[".| .| .| .|"]) = (1;1;1;1)];
    .qython.assert[(candidate["o| o| .| .| o o o o"]) = (2;2;1;1;4;4;4;4)];
    .qython.assert[(candidate["o| .| o| .| o o| o o|"]) = (2;1;2;1;4;2;4;2)]
    }
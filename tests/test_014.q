candidate: all_prefixes;

check:{[candidate]
    .qython.assert[candidate[""]~()];
    .qython.assert[candidate["asdfgh"]~(enlist["a"];"as";"asd";"asdf";"asdfg";"asdfgh")];
    .qython.assert[candidate["WWW"]~(enlist["W"];"WW";"WWW")]
    }
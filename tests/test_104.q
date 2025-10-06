candidate: unique_digits;

check:{[candidate]
    .qython.assert[candidate[(15;33;1422;1)] = (1;15;33)];
    .qython.assert[candidate[(152;323;1422;10)] = ()];
    .qython.assert[candidate[(12345;2033;111;151)] = (111;151)];
    .qython.assert[candidate[(135;103;31)] = (31;135)];
    .qython.assert[1b]
    }
candidate: filter_by_substring;

check:{[candidate]
    .qython.assert[candidate[();"john"]~()];
    .qython.assert[(candidate[("xxx";"asd";"xxy";"john doe";"xxxAAA";"xxx");"xxx"])~("xxx";"xxxAAA";"xxx")];
    .qython.assert[(candidate[("xxx";"asd";"aaaxxy";"john doe";"xxxAAA";"xxx");"xx"])~("xxx";"aaaxxy";"xxxAAA";"xxx")];
    .qython.assert[candidate[("grunt";"trumpet";"prune";"gruesome");"run"]~("grunt";"prune")]
    }
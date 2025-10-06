candidate: filter_by_prefix;

check:{[candidate]
    .qython.assert[candidate[();"john"] = ()];
    .qython.assert[(candidate[("xxx";"asd";"xxy";"john doe";"xxxAAA";"xxx");"xxx"]) = ("xxx";"xxxAAA";"xxx")]
    }
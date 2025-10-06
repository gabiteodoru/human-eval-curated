candidate: Strongest_Extension;

check:{[candidate]
    .qython.assert[candidate["Watashi";("tEN";"niNE";"eIGHt8OKe")] = "Watashi.eIGHt8OKe"];
    .qython.assert[candidate["Boku123";("nani";"NazeDa";"YEs.WeCaNe";"32145tggg")] = "Boku123.YEs.WeCaNe"];
    .qython.assert[candidate["__YESIMHERE";(enlist["t"];"eMptY";"nothing";"zeR00";"NuLl__";"123NoooneB321")] = "__YESIMHERE.NuLl__"];
    .qython.assert[candidate[enlist["K"];("Ta";"TAR";"t234An";"cosSo")] = "K.TAR"];
    .qython.assert[candidate["__HAHA";("Tab";"123";"781345";"-_-")] = "__HAHA.123"];
    .qython.assert[candidate["YameRore";("HhAas";"okIWILL123";"WorkOut";"Fails";"-_-")] = "YameRore.okIWILL123"];
    .qython.assert[candidate["finNNalLLly";("Die";"NowW";"Wow";"WoW")] = "finNNalLLly.WoW"];
    .qython.assert[candidate[enlist["_"];("Bb";"91245")] = "_.Bb"];
    .qython.assert[candidate["Sp";("671235";"Bb")] = "Sp.671235"]
    }
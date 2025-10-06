candidate: encode;

check:{[candidate]
    .qython.assert2[candidate["TEST"] = "tgst";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["Mudasir"] = "mWDCSKR";"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate["YES"] = "ygs";"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[(candidate["This is a message"]) = ("tHKS KS C MGSSCGG");"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[(candidate["I DoNt KnOw WhAt tO WrItE"]) = ("k dQnT kNqW wHcT Tq wRkTg");"This prints if this assert fails 2 (also good for debugging!)"]
    }
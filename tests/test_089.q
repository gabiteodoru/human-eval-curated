candidate: encrypt;

check:{[candidate]
    .qython.assert2[candidate["hi"] = "lm";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["asdfghjkl"] = "ewhjklnop";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["gf"] = "kj";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["et"] = "ix";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["faewfawefaewg"] = "jeiajeaijeiak";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["hellomyfriend"] = "lippsqcjvmirh";"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate["dxzdlmnilfuhmilufhlihufnmlimnufhlimnufhfucufh"] = "hbdhpqrmpjylqmpyjlpmlyjrqpmqryjlpmqryjljygyjl";"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[enlist["a"]] = enlist["e"];"This prints if this assert fails 2 (also good for debugging!)"]
    }
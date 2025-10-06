candidate: fix_spaces;

check:{[candidate]
    .qython.assert2[candidate["Example"] = "Example";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[(candidate["Mudasir Hanif "]) = "Mudasir_Hanif_";"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[(candidate["Yellow Yellow  Dirty  Fellow"]) = "Yellow_Yellow__Dirty__Fellow";"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[(candidate["Exa   mple"]) = "Exa-mple";"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[(candidate["   Exa 1 2 2 mple"]) = "-Exa_1_2_2_mple";"This prints if this assert fails 4 (good for debugging!)"]
    }
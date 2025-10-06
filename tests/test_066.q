candidate: digitSum;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[""] = 0;"Error"];
    .qython.assert2[candidate["abAB"] = 131;"Error"];
    .qython.assert2[candidate["abcCd"] = 67;"Error"];
    .qython.assert2[candidate["helloE"] = 69;"Error"];
    .qython.assert2[candidate["woArBld"] = 131;"Error"];
    .qython.assert2[candidate["aAaaaXa"] = 153;"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[(candidate[" How are yOu?"]) = 151;"Error"];
    .qython.assert2[(candidate["You arE Very Smart"]) = 327;"Error"]
    }
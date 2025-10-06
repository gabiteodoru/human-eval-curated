candidate: solve;

check:{[candidate]
    .qython.assert[candidate["AsDf"] = "aSdF"];
    .qython.assert[candidate["1234"] = "4321"];
    .qython.assert[candidate["ab"] = "AB"];
    .qython.assert[candidate["#a@C"] = "#A@c"];
    .qython.assert[candidate["#AsdfW^45"] = "#aSDFw^45"];
    .qython.assert[candidate["#6@2"] = "2@6#"];
    .qython.assert[candidate["#$a^D"] = "#$A^d"];
    .qython.assert[candidate["#ccc"] = "#CCC"]
    }    / Don'
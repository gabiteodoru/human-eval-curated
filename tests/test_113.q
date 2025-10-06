candidate: odd_count;

check:{[candidate]
    .qython.assert2[(candidate[enlist "1234567"]) = enlist ("the number of odd elements 4n the str4ng 4 of the 4nput.");"Test 1"];
    .qython.assert2[candidate[(enlist["3"];"11111111")] = (("the number of odd elements 1n the str1ng 1 of the 1nput.");("the number of odd elements 8n the str8ng 8 of the 8nput."));"Test 2"];
    .qython.assert[candidate[("271";"137";"314")] = (("the number of odd elements 2n the str2ng 2 of the 2nput.");("the number of odd elements 3n the str3ng 3 of the 3nput.");("the number of odd elements 2n the str2ng 2 of the 2nput."))];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
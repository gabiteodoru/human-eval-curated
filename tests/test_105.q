candidate: by_length;

check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[any candidate[(2;1;1;4;5;8;2;3)] ~/: {(x;`$x)} ("Eight";"Five";"Four";"Three";"Two";"Two";"One";"One");"Error"];
    .qython.assert2[0=count candidate[()];"Error"];
    .qython.assert2[any candidate[(1;-1;55)] ~/: {(x;`$x)} enlist "One";"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[any candidate[(1;-1;3;2)] ~/: {(x;`$x)} ("Three";"Two";"One")];
    .qython.assert[any candidate[(9;4;8)] ~/: {(x;`$x)} ("Nine";"Eight";"Four")]
    }
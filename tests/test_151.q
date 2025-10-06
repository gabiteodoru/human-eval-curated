candidate: double_the_difference;

check:{[candidate]
    .qython.assert2[candidate[()] = 0;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(5;4)] = 25;"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate[(0.1;0.2;0.3)] = 0;"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[(-10;-20;-30)] = 0;"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[candidate[(-1;-2;8)] = 0;"This prints if this assert fails 5 (also good for debugging!)"];
    .qython.assert2[candidate[(0.2;3;5)] = 34;"This prints if this assert fails 6 (also good for debugging!)"];
    lst:.qython.arange[-99;100;2];
    odd_sum:sum[{[i] i xexp 2} each lst where {[i] ((i mod 2) <> 0) and i > 0} each lst];
    .qython.assert2[candidate[lst] = odd_sum;"This prints if this assert fails 7 (good for debugging!)"]
    }
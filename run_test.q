system"l qython.q";
o: .Q.opt .z.x;
problem_file: "solutions/",o[`mode;0],"/problem_",(-3$"00",o[`problem;0]),".q";
test_file: "tests/test_",(-3$"00",raze o[`problem;0]),".q";
@[system;"l ", problem_file;{-1 x; if["No such file" qin x; -1 "File may be missing because LLM failed to find a solution."];exit 1}]; 
@[system;"l ", test_file; {-1 x; if["No such file" qin x; -1 "Test file should never be missing, the harness is broken."];exit 1}];
@[check;candidate;{-1[x];exit 1}];
exit 0;

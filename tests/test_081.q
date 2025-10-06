candidate: numerical_letter_grade;

check:{[candidate]
    .qython.assert[candidate[(4.0;3;1.7;2;3.5)] = ("A+";enlist["B"];"C-";enlist["C"];"A-")];
    .qython.assert[(candidate[enlist 1.2]) = enlist "D+"];
    .qython.assert[(candidate[enlist 0.5]) = enlist "D-"];
    .qython.assert[(candidate[enlist 0.0]) = enlist enlist["E"]];
    .qython.assert[candidate[(1;0.3;1.5;2.8;3.3)] = (enlist["D"];"D-";"C-";enlist["B"];"B+")];
    .qython.assert[candidate[(0;0.7)] = (enlist["E"];"D-")];
    .qython.assert[1b]
    }
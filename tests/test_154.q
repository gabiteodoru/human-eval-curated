candidate: cycpattern_check;

check:{[candidate]
    .qython.assert2[candidate["xyzw";"xyw"] = 0b;"test #0"];
    .qython.assert2[candidate["yello";"ell"] = 1b;"test #1"];
    .qython.assert2[candidate["whattup";"ptut"] = 0b;"test #2"];
    .qython.assert2[candidate["efef";"fee"] = 1b;"test #3"];
    .qython.assert2[candidate["abab";"aabb"] = 0b;"test #4"];
    .qython.assert2[candidate["winemtt";"tinem"] = 1b;"test #5"]
    }
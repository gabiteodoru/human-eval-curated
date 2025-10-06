candidate: is_happy;

check:{[candidate]
    .qython.assert2[candidate[enlist["a"]] = 0b;enlist["a"]];
    .qython.assert2[candidate["aa"] = 0b;"aa"];
    .qython.assert2[candidate["abcd"] = 1b;"abcd"];
    .qython.assert2[candidate["aabb"] = 0b;"aabb"];
    .qython.assert2[candidate["adb"] = 1b;"adb"];
    .qython.assert2[candidate["xyy"] = 0b;"xyy"];
    .qython.assert2[candidate["iopaxpoi"] = 1b;"iopaxpoi"];
    .qython.assert2[candidate["iopaxioi"] = 0b;"iopaxioi"]
    }
candidate: file_name_check;

check:{[candidate]
    .qython.assert[candidate["example.txt"] = "Yes"];
    .qython.assert[candidate["1example.dll"] = "No"];
    .qython.assert[candidate["s1sdf3.asd"] = "No"];
    .qython.assert[candidate["K.dll"] = "Yes"];
    .qython.assert[candidate["MY16FILE3.exe"] = "Yes"];
    .qython.assert[candidate["His12FILE94.exe"] = "No"];
    .qython.assert[candidate["_Y.txt"] = "No"];
    .qython.assert[candidate["?aREYA.exe"] = "No"];
    .qython.assert[candidate["/this_is_valid.dll"] = "No"];
    .qython.assert[candidate["this_is_valid.wow"] = "No"];
    .qython.assert[candidate["this_is_valid.txt"] = "Yes"];
    .qython.assert[candidate["this_is_valid.txtexe"] = "No"];
    .qython.assert[candidate["#this2_i4s_5valid.ten"] = "No"];
    .qython.assert[candidate["@this1_is6_valid.exe"] = "No"];
    .qython.assert[candidate["this_is_12valid.6exe4.txt"] = "No"];
    .qython.assert[candidate["all.exe.txt"] = "No"];
    .qython.assert[candidate["I563_No.exe"] = "Yes"];
    .qython.assert[candidate["Is3youfault.txt"] = "Yes"];
    .qython.assert[candidate["no_one#knows.dll"] = "Yes"];
    .qython.assert[candidate["1I563_Yes3.exe"] = "No"];
    .qython.assert[candidate["I563_Yes3.txtt"] = "No"];
    .qython.assert[candidate["final..txt"] = "No"];
    .qython.assert[candidate["final132"] = "No"];
    .qython.assert[candidate["_f4indsartal132."] = "No"];
    .qython.assert[candidate[".txt"] = "No"];
    .qython.assert[candidate["s."] = "No"]
    }
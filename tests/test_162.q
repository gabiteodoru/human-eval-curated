candidate: string_to_md5;

check:{[candidate]
    .qython.assert[(candidate["Hello world"]) = "3e25960a79dbc69b674cd4ec67a72c62"];
    .qython.assert[candidate[""] = (::)];
    .qython.assert[(candidate["A B C"]) = "0ef78513b0cb8cef12743f5aeb35f888"];
    .qython.assert[candidate["password"] = "5f4dcc3b5aa765d61d8327deb882cf99"];
    .qython.assert[1b]
    }
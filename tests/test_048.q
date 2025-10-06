candidate: is_palindrome;

check:{[candidate]
    .qython.assert[candidate[""] = 1b];
    .qython.assert[candidate["aba"] = 1b];
    .qython.assert[candidate["aaaaa"] = 1b];
    .qython.assert[candidate["zbcd"] = 0b];
    .qython.assert[candidate["xywyx"] = 1b];
    .qython.assert[candidate["xywyz"] = 0b];
    .qython.assert[candidate["xywzx"] = 0b]
    }
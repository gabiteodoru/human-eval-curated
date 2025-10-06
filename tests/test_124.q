candidate: valid_date;

check:{[candidate]
    .qython.assert[candidate["03-11-2000"] = 1b];
    .qython.assert[candidate["15-01-2012"] = 0b];
    .qython.assert[candidate["04-0-2040"] = 0b];
    .qython.assert[candidate["06-04-2020"] = 1b];
    .qython.assert[candidate["01-01-2007"] = 1b];
    .qython.assert[candidate["03-32-2011"] = 0b];
    .qython.assert[candidate[""] = 0b];
    .qython.assert[candidate["04-31-3000"] = 0b];
    .qython.assert[candidate["06-06-2005"] = 1b];
    .qython.assert[candidate["21-31-2000"] = 0b];
    .qython.assert[candidate["04-12-2003"] = 1b];
    .qython.assert[candidate["04122003"] = 0b];
    .qython.assert[candidate["20030412"] = 0b];
    .qython.assert[candidate["2003-04"] = 0b];
    .qython.assert[candidate["2003-04-12"] = 0b];
    .qython.assert[candidate["04-2003"] = 0b]
    }
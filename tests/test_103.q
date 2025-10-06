candidate: rounded_avg;

check:{[candidate]
    .qython.assert[candidate[1;5] = "0b11"];
    .qython.assert[candidate[7;13] = "0b1010"];
    .qython.assert[candidate[964;977] = "0b1111001010"];
    .qython.assert[candidate[996;997] = "0b1111100100"];
    .qython.assert[candidate[560;851] = "0b1011000010"];
    .qython.assert[candidate[185;546] = "0b101101110"];
    .qython.assert[candidate[362;496] = "0b110101101"];
    .qython.assert[candidate[350;902] = "0b1001110010"];
    .qython.assert[candidate[197;233] = "0b11010111"];
    .qython.assert[candidate[7;5] = -1];
    .qython.assert[candidate[5;1] = -1];
    .qython.assert[candidate[5;5] = "0b101"]
    }
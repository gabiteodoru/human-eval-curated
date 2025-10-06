candidate: max_element;

check:{[candidate]
    .qython.assert[candidate[(1;2;3)] = 3];
    .qython.assert[candidate[(5;3;-5;2;-3;3;9;0;124;1;-10)] = 124]
    }
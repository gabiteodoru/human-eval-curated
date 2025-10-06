get_row: {[lst;x] coords: raze {[i;row;val] (i,'where row=val)}[;;x] .' flip (til count lst; lst); coords[iasc flip (coords[;0]; neg coords[;1])]};

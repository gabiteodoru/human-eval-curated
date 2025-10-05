get_positive:{[lst]
    "Return only positive numbers in the list.";
    arr:lst;
    :arr[where[arr > 0]]
    }
/ np.array() is unnecessary in Qython - all lists are automatically numpy arrays. Use the argument directly.
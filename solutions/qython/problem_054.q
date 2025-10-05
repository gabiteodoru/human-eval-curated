same_chars:{[s0;s1]
    "
    Check if two words have the same characters.
    ";
    unique0:asc[distinct[s0]];
    unique1:asc[distinct[s1]];
    :unique0~unique1
    }
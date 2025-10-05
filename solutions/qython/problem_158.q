find_max:{[words]
    unique_counts:{[word] count[distinct[word]]} each words;
    max_count:max[unique_counts];
    candidates:{[words;i] words[i]}[words] each .qython.arange[count[words]] where {[unique_counts;max_count;i] unique_counts[i] = max_count}[unique_counts;max_count] each .qython.arange[count[words]];
    sorted_candidates:asc[candidates];
    :sorted_candidates[0]
    }
words_string:{[s]
    s:.qython.replace[s; enlist[","]; enlist[" "]];
    words:.qython.split[enlist[" "]; s];
    result:.qython.filter[{[w] count[w] > 0};words];
    :result
    }
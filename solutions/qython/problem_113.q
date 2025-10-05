odd_count:{[lst]
    process_string:{[s]
        odd_digits:sum[{[char] .qython.int[char] mod 2} each s];
        count_str:.qython.str[odd_digits];
        template:"the number of odd elements Xn the strXng X of the Xnput.";
        result:.qython.replace[template; enlist["X"]; .qython.String[count_str]];
        :result
        };
    :process_string each lst
    }
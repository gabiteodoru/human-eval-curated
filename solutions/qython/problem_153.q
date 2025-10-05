Strongest_Extension:{[class_name;extensions]
    "Find the strongest extension based on uppercase - lowercase count";
    calculate_strength:{[ext]
        "Calculate strength: uppercase_count - lowercase_count";
        is_uppercase:{[c]
            :(c >= "A") and c <= "Z"
            };
        is_lowercase:{[c]
            :(c >= "a") and c <= "z"
            };
        cap:sum[{[is_uppercase;c] $[is_uppercase[c];1;0]}[is_uppercase] each ext];
        sm:sum[{[is_lowercase;c] $[is_lowercase[c];1;0]}[is_lowercase] each ext];
        :cap-sm
        };
    strengths:{[calculate_strength;ext] calculate_strength[ext]}[calculate_strength] each extensions;
    max_strength:max[strengths];
    max_index:.qython.index[strengths;max_strength];
    result:raze[(class_name;enlist["."];extensions[max_index])];
    :result
    }
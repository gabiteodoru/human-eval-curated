parse_nested_parens:{[paren_string]
    "Input to this function is a string represented multiple groups for nested parentheses separated by spaces.
    For each of the group, output the deepest level of nesting of parentheses.
    E.g. (()()) has maximum two levels of nesting while ((())) has three.

    >>> parse_nested_parens(String('(()()) ((())) () ((())()())'))
    [2, 3, 1, 3]
    ";
    max_depth_group:{[paren_str]
        "Calculate maximum nesting depth for a single group of parentheses";
        increments:{[c] $[c~"(";1;-1]} each paren_str;
        depths:sums[increments];
        :max[depths]
        };
    groups:.qython.split[" "; paren_string];
    :max_depth_group each groups
    }
string_to_md5:{[text]
    "
    Given a string String('text'), return its md5 hash equivalent string.
    If String('text') is an empty string, return None.
    ";
    if[count[text] = 0;
        :(::)
        ];
    :.qython.md5[text]
    }
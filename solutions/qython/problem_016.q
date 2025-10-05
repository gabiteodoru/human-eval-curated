count_distinct_characters:{[text]
    "Given a string, find out how many distinct characters (regardless of case) does it consist of";
    lowercase_text:lower[text];
    distinct_chars:distinct[lowercase_text];
    :count[distinct_chars]
    }
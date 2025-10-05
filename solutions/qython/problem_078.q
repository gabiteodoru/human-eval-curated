hex_key:{[num]
    prime_hex_digits:("2";"3";"5";"7";"B";"D");
    num_str:.qython.String[num];
    result:sum[{[prime_hex_digits;char] $[char qin prime_hex_digits;1;0]}[prime_hex_digits] each num_str];
    :result
    }
/ Sort array by number of ones in binary representation, then by decimal value
sort_array: {[arr]
  ones: sum each 0b vs/:arr;
  arr iasc ones,'arr
 }

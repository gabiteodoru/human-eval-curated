numberMap: `zero`one`two`three`four`five`six`seven`eight`nine!til 10;

sort_numbers: {[numbers]
  if[""~numbers; :numbers];
  words: `$" " vs numbers;
  sorted: words iasc numberMap words;
  " " sv string sorted
  };

/ HumanEval Problem 146: specialFilter
/ Takes an array of numbers and returns the count of elements that are:
/ 1. Greater than 10
/ 2. Have both first and last digits odd (1, 3, 5, 7, 9)

specialFilter: {[nums]
  / Helper function to check if first and last digits are odd
  isFirstLastOdd: {[n]
    str: string abs n;
    firstDigit: "I"$first str;
    lastDigit: "I"$last str;
    (firstDigit mod 2) and (lastDigit mod 2)
  };
  / Filter numbers > 10
  filtered: nums where nums > 10;
  / Count those with odd first and last digits
  sum isFirstLastOdd each filtered
 };

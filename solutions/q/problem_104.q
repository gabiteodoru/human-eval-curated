/ Helper function to check if a number has any even digit
hasEvenDigit: {any 0=mod[;2] 10 vs x};

/ Given a list of positive integers x, return a sorted list of all
/ elements that don't have any even digit
unique_digits: {asc x where not hasEvenDigit each x};

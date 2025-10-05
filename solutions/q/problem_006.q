/ Helper function to calculate max nesting depth for a single group
maxDepth: {[s]
  / s is a string of parentheses
  / Use scan to track running depth: +1 for '(', -1 for ')'
  depths: sums ("(" = s) - ")" = s;
  max depths
 };

/ Main function to parse nested parentheses
parse_nested_parens: {[paren_string]
  / Split by spaces to get groups
  groups: " " vs paren_string;
  / Apply maxDepth to each group
  maxDepth each groups
 };

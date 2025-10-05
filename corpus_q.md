# HumanEval Problems Collection

This document contains all HumanEval problems in a human-readable format.

================================================================================

<!-- PROBLEM_START:0 -->
# Problem 0

<!-- META_START -->
**Task ID:** HumanEval/0
**Entry Point:** has_close_elements
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def has_close_elements(numbers: List[float], threshold: float) -> bool:
    """ Check if in given list of numbers, are any two numbers closer to each other than
    given threshold.
    >>> has_close_elements([1.0, 2.0, 3.0], 0.5)
    False
    >>> has_close_elements([1.0, 2.8, 3.0, 4.0, 5.0, 2.0], 0.3)
    True
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
for idx, elem in enumerate(numbers):
        for idx2, elem2 in enumerate(numbers):
            if idx != idx2:
                distance = abs(elem - elem2)
                if distance < threshold:
                    return True

    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1.0;2.0;3.9;4.0;5.0;2.2);0.3] = 1b];
    .qython.assert[candidate[(1.0;2.0;3.9;4.0;5.0;2.2);0.05] = 0b];
    .qython.assert[candidate[(1.0;2.0;5.9;4.0;5.0);0.95] = 1b];
    .qython.assert[candidate[(1.0;2.0;5.9;4.0;5.0);0.8] = 0b];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0;2.0);0.1] = 1b];
    .qython.assert[candidate[(1.1;2.2;3.1;4.1;5.1);1.0] = 1b];
    .qython.assert[candidate[(1.1;2.2;3.1;4.1;5.1);0.5] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:0 -->
================================================================================

<!-- PROBLEM_START:1 -->
# Problem 1

<!-- META_START -->
**Task ID:** HumanEval/1
**Entry Point:** separate_paren_groups
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def separate_paren_groups(paren_string: str) -> List[str]:
    """ Input to this function is a string containing multiple groups of nested parentheses. Your goal is to
    separate those group into separate strings and return the list of those.
    Separate groups are balanced (each open brace is properly closed) and not nested within each other
    Ignore any spaces in the input string.
    >>> separate_paren_groups('( ) (( )) (( )( ))')
    ['()', '(())', '(()())']
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
result = []
    current_string = []
    current_depth = 0

    for c in paren_string:
        if c == '(':
            current_depth += 1
            current_string.append(c)
        elif c == ')':
            current_depth -= 1
            current_string.append(c)

            if current_depth == 0:
                result.append(''.join(current_string))
                current_string.clear()

    return result
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate["(()()) ((())) () ((())()())"])~("(()())";"((()))";"()";"((())()())")];
    .qython.assert[(candidate["() (()) ((())) (((())))"])~("()";"(())";"((()))";"(((())))")];
    .qython.assert[candidate["(()(())((())))"]~enlist "(()(())((())))"];
    .qython.assert[(candidate["( ) (( )) (( )( ))"])~("()";"(())";"(()())")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:1 -->
================================================================================

<!-- PROBLEM_START:2 -->
# Problem 2

<!-- META_START -->
**Task ID:** HumanEval/2
**Entry Point:** truncate_number
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def truncate_number(number: float) -> float:
    """ Given a positive floating point number, it can be decomposed into
    and integer part (largest integer smaller than given number) and decimals
    (leftover part always smaller than 1).

    Return the decimal part of the number.
    >>> truncate_number(3.5)
    0.5
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return number % 1.0
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[3.5] = 0.5];
    .qython.assert[abs[candidate[1.33]-0.33] < 1e-6];
    .qython.assert[abs[candidate[123.456]-0.456] < 1e-6]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:2 -->
================================================================================

<!-- PROBLEM_START:3 -->
# Problem 3

<!-- META_START -->
**Task ID:** HumanEval/3
**Entry Point:** below_zero
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def below_zero(operations: List[int]) -> bool:
    """ You're given a list of deposit and withdrawal operations on a bank account that starts with
    zero balance. Your task is to detect if at any point the balance of account fallls below zero, and
    at that point function should return True. Otherwise it should return False.
    >>> below_zero([1, 2, 3])
    False
    >>> below_zero([1, 2, -4, 5])
    True
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
balance = 0

    for op in operations:
        balance += op
        if balance < 0:
            return True

    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = 0b];
    .qython.assert[candidate[(1;2;-3;1;2;-3)] = 0b];
    .qython.assert[candidate[(1;2;-4;5;6)] = 1b];
    .qython.assert[candidate[(1;-1;2;-2;5;-5;4;-4)] = 0b];
    .qython.assert[candidate[(1;-1;2;-2;5;-5;4;-5)] = 1b];
    .qython.assert[candidate[(1;-2;2;-2;5;-5;4;-4)] = 1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:3 -->
================================================================================

<!-- PROBLEM_START:4 -->
# Problem 4

<!-- META_START -->
**Task ID:** HumanEval/4
**Entry Point:** mean_absolute_deviation
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def mean_absolute_deviation(numbers: List[float]) -> float:
    """ For a given list of input numbers, calculate Mean Absolute Deviation
    around the mean of this dataset.
    Mean Absolute Deviation is the average absolute difference between each
    element and a centerpoint (mean in this case):
    MAD = average | x - x_mean |
    >>> mean_absolute_deviation([1.0, 2.0, 3.0, 4.0])
    1.0
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
mean = sum(numbers) / len(numbers)
    return sum(abs(x - mean) for x in numbers) / len(numbers)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[abs[candidate[(1.0;2.0;3.0)]-2.0%3.0] < 1e-6];
    .qython.assert[abs[candidate[(1.0;2.0;3.0;4.0)]-1.0] < 1e-6];
    .qython.assert[abs[candidate[(1.0;2.0;3.0;4.0;5.0)]-6.0%5.0] < 1e-6]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:4 -->
================================================================================

<!-- PROBLEM_START:5 -->
# Problem 5

<!-- META_START -->
**Task ID:** HumanEval/5
**Entry Point:** intersperse
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def intersperse(numbers: List[int], delimeter: int) -> List[int]:
    """ Insert a number 'delimiter' between every two consecutive elements of input list `numbers'
    >>> intersperse([], 4)
    []
    >>> intersperse([1, 2, 3], 4)
    [1, 4, 2, 4, 3]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if not numbers:
        return []

    result = []

    for n in numbers[:-1]:
        result.append(n)
        result.append(delimeter)

    result.append(numbers[-1])

    return result
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[();7] = ()];
    .qython.assert[candidate[(5;6;3;2);8] = (5;8;6;8;3;8;2)];
    .qython.assert[candidate[(2;2;2);2] = (2;2;2;2;2)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:5 -->
================================================================================

<!-- PROBLEM_START:6 -->
# Problem 6

<!-- META_START -->
**Task ID:** HumanEval/6
**Entry Point:** parse_nested_parens
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def parse_nested_parens(paren_string: str) -> List[int]:
    """ Input to this function is a string represented multiple groups for nested parentheses separated by spaces.
    For each of the group, output the deepest level of nesting of parentheses.
    E.g. (()()) has maximum two levels of nesting while ((())) has three.

    >>> parse_nested_parens('(()()) ((())) () ((())()())')
    [2, 3, 1, 3]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def parse_paren_group(s):
        depth = 0
        max_depth = 0
        for c in s:
            if c == '(':
                depth += 1
                max_depth = max(depth, max_depth)
            else:
                depth -= 1

        return max_depth

    return [parse_paren_group(x) for x in paren_string.split(' ') if x]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate["(()()) ((())) () ((())()())"]) = (2;3;1;3)];
    .qython.assert[(candidate["() (()) ((())) (((())))"]) = (1;2;3;4)];
    .qython.assert[candidate["(()(())((())))"] = enlist 4]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:6 -->
================================================================================

<!-- PROBLEM_START:7 -->
# Problem 7

<!-- META_START -->
**Task ID:** HumanEval/7
**Entry Point:** filter_by_substring
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def filter_by_substring(strings: List[str], substring: str) -> List[str]:
    """ Filter an input list of strings only for ones that contain given substring
    >>> filter_by_substring([], 'a')
    []
    >>> filter_by_substring(['abc', 'bacd', 'cde', 'array'], 'a')
    ['abc', 'bacd', 'array']
    >>> filter_by_substring(['hello', 'world', 'help'], 'el')
    ['hello', 'help']
    >>> filter_by_substring(['python', 'java', 'javascript'], 'java')
    ['java', 'javascript']
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [x for x in strings if substring in x]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[();"john"]~()];
    .qython.assert[(candidate[("xxx";"asd";"xxy";"john doe";"xxxAAA";"xxx");"xxx"])~("xxx";"xxxAAA";"xxx")];
    .qython.assert[(candidate[("xxx";"asd";"aaaxxy";"john doe";"xxxAAA";"xxx");"xx"])~("xxx";"aaaxxy";"xxxAAA";"xxx")];
    .qython.assert[candidate[("grunt";"trumpet";"prune";"gruesome");"run"]~("grunt";"prune")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:7 -->
================================================================================

<!-- PROBLEM_START:8 -->
# Problem 8

<!-- META_START -->
**Task ID:** HumanEval/8
**Entry Point:** sum_product
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List, Tuple


def sum_product(numbers: List[int]) -> Tuple[int, int]:
    """ For a given list of integers, return a tuple consisting of a sum and a product of all the integers in a list.
    Empty sum should be equal to 0 and empty product should be equal to 1.
    >>> sum_product([])
    (0, 1)
    >>> sum_product([1, 2, 3, 4])
    (10, 24)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
sum_value = 0
    prod_value = 1

    for n in numbers:
        sum_value += n
        prod_value *= n
    return sum_value, prod_value
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = (0;1)];
    .qython.assert[candidate[(1;1;1)] = (3;1)];
    .qython.assert[candidate[(100;0)] = (100;0)];
    .qython.assert[candidate[(3;5;7)] = ((3+5)+7;(3*5)*7)];
    .qython.assert[(candidate[enlist 10]) = (10;10)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:8 -->
================================================================================

<!-- PROBLEM_START:9 -->
# Problem 9

<!-- META_START -->
**Task ID:** HumanEval/9
**Entry Point:** running_max
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List, Tuple


def running_max(numbers: List[int]) -> List[int]:
    """ From a given list of integers, generate a list of running maximum element found until given moment
    in the sequence.
    >>> running_max([1, 2, 3, 2, 3, 4, 2])
    [1, 2, 3, 3, 3, 4, 4]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
running_max = None
    result = []

    for n in numbers:
        if running_max is None:
            running_max = n
        else:
            running_max = max(running_max, n)

        result.append(running_max)

    return result
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;2;3;4)] = (1;2;3;4)];
    .qython.assert[candidate[(4;3;2;1)] = (4;4;4;4)];
    .qython.assert[candidate[(3;2;3;100;3)] = (3;3;3;100;100)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:9 -->
================================================================================

<!-- PROBLEM_START:10 -->
# Problem 10

<!-- META_START -->
**Task ID:** HumanEval/10
**Entry Point:** make_palindrome
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_palindrome(string: str) -> bool:
    """ Test if given string is a palindrome """
    return string is string[::-1]


def make_palindrome(string: str) -> str:
    """ Find the shortest palindrome that begins with a supplied string.
    Algorithm idea is simple:
    - Find the longest postfix of supplied string that is a palindrome.
    - Append to the end of the string reverse of a string prefix that comes before the palindromic suffix.
    - Include is_palindrome in final solution file
    >>> make_palindrome('')
    ''
    >>> make_palindrome('cat')
    'catac'
    >>> make_palindrome('cata')
    'catac'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if not string:
        return ''

    beginning_of_suffix = 0

    while not is_palindrome(string[beginning_of_suffix:]):
        beginning_of_suffix += 1

    return string + string[:beginning_of_suffix][::-1]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""]~""];
    .qython.assert[candidate[enlist["x"]]~enlist["x"]];
    .qython.assert[candidate["xyz"]~"xyzyx"];
    .qython.assert[candidate["xyx"]~"xyx"];
    .qython.assert[candidate["jerry"]~"jerryrrej"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:10 -->
================================================================================

<!-- PROBLEM_START:11 -->
# Problem 11

<!-- META_START -->
**Task ID:** HumanEval/11
**Entry Point:** string_xor
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def string_xor(a: str, b: str) -> str:
    """ Input are two strings a and b consisting only of 1s and 0s.
    Perform binary XOR on these inputs and return result also as a string.
    >>> string_xor('010', '110')
    '100'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def xor(i, j):
        if i == j:
            return '0'
        else:
            return '1'

    return ''.join(xor(x, y) for x, y in zip(a, b))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["111000";"101010"]~"010010"];
    .qython.assert[candidate[enlist["1"];enlist["1"]]~enlist["0"]];
    .qython.assert[candidate["0101";"0000"]~"0101"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:11 -->
================================================================================

<!-- PROBLEM_START:12 -->
# Problem 12

<!-- META_START -->
**Task ID:** HumanEval/12
**Entry Point:** longest
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List, Optional


def longest(strings: List[str]) -> Optional[str]:
    """ Out of list of strings, return the longest one. Return the first one in case of multiple
    strings of the same length. Return None in case the input list is empty.
    >>> longest([])

    >>> longest(['a', 'b', 'c'])
    'a'
    >>> longest(['a', 'bb', 'ccc'])
    'ccc'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if not strings:
        return None

    maxlen = max(len(x) for x in strings)
    for s in strings:
        if len(s) == maxlen:
            return s
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()]~(::)];
    .qython.assert[candidate[(enlist["x"];enlist["y"];enlist["z"])]~enlist["x"]];
    .qython.assert[candidate[(enlist["x"];"yyy";"zzzz";"www";"kkkk";"abc")]~"zzzz"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:12 -->
================================================================================

<!-- PROBLEM_START:13 -->
# Problem 13

<!-- META_START -->
**Task ID:** HumanEval/13
**Entry Point:** greatest_common_divisor
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def greatest_common_divisor(a: int, b: int) -> int:
    """ Return a greatest common divisor of two integers a and b
    >>> greatest_common_divisor(3, 5)
    1
    >>> greatest_common_divisor(25, 15)
    5
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
while b:
        a, b = b, a % b
    return a
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[3;7] = 1];
    .qython.assert[candidate[10;15] = 5];
    .qython.assert[candidate[49;14] = 7];
    .qython.assert[candidate[144;60] = 12]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:13 -->
================================================================================

<!-- PROBLEM_START:14 -->
# Problem 14

<!-- META_START -->
**Task ID:** HumanEval/14
**Entry Point:** all_prefixes
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def all_prefixes(string: str) -> List[str]:
    """ Return list of all prefixes from shortest to longest of the input string
    >>> all_prefixes('abc')
    ['a', 'ab', 'abc']
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
result = []

    for i in range(len(string)):
        result.append(string[:i+1])
    return result
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""]~()];
    .qython.assert[candidate["asdfgh"]~(enlist["a"];"as";"asd";"asdf";"asdfg";"asdfgh")];
    .qython.assert[candidate["WWW"]~(enlist["W"];"WW";"WWW")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:14 -->
================================================================================

<!-- PROBLEM_START:15 -->
# Problem 15

<!-- META_START -->
**Task ID:** HumanEval/15
**Entry Point:** string_sequence
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def string_sequence(n: int) -> str:
    """ Return a string containing space-delimited numbers starting from 0 upto n inclusive.
    >>> string_sequence(0)
    '0'
    >>> string_sequence(5)
    '0 1 2 3 4 5'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return ' '.join([str(x) for x in range(n + 1)])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[0]~enlist["0"]];
    .qython.assert[candidate[3]~("0 1 2 3")];
    .qython.assert[candidate[10]~("0 1 2 3 4 5 6 7 8 9 10")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:15 -->
================================================================================

<!-- PROBLEM_START:16 -->
# Problem 16

<!-- META_START -->
**Task ID:** HumanEval/16
**Entry Point:** count_distinct_characters
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def count_distinct_characters(string: str) -> int:
    """ Given a string, find out how many distinct characters (regardless of case) does it consist of
    >>> count_distinct_characters('xyzXYZ')
    3
    >>> count_distinct_characters('Jerry')
    4
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return len(set(string.lower()))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = 0];
    .qython.assert[candidate["abcde"] = 5];
    .qython.assert[candidate["abcdecadeCADE"] = 5];
    .qython.assert[candidate["aaaaAAAAaaaa"] = 1];
    .qython.assert[(candidate["Jerry jERRY JeRRRY"]) = 5]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:16 -->
================================================================================

<!-- PROBLEM_START:17 -->
# Problem 17

<!-- META_START -->
**Task ID:** HumanEval/17
**Entry Point:** parse_music
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def parse_music(music_string: str) -> List[int]:
    """ Input to this function is a string representing musical notes in a special ASCII format.
    Your task is to parse this string and return list of integers corresponding to how many beats does each
    not last.

    Here is a legend:
    'o' - whole note, lasts four beats
    'o|' - half note, lasts two beats
    '.|' - quater note, lasts one beat

    >>> parse_music('o o| .| o| o| .| .| .| .| o o')
    [4, 2, 1, 2, 2, 1, 1, 1, 1, 4, 4]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
note_map = {'o': 4, 'o|': 2, '.|': 1}
    return [note_map[x] for x in music_string.split(' ') if x]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = ()];
    .qython.assert[(candidate["o o o o"]) = (4;4;4;4)];
    .qython.assert[(candidate[".| .| .| .|"]) = (1;1;1;1)];
    .qython.assert[(candidate["o| o| .| .| o o o o"]) = (2;2;1;1;4;4;4;4)];
    .qython.assert[(candidate["o| .| o| .| o o| o o|"]) = (2;1;2;1;4;2;4;2)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:17 -->
================================================================================

<!-- PROBLEM_START:18 -->
# Problem 18

<!-- META_START -->
**Task ID:** HumanEval/18
**Entry Point:** how_many_times
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def how_many_times(string: str, substring: str) -> int:
    """ Find how many times a given substring can be found in the original string. Count overlaping cases.
    >>> how_many_times('', 'a')
    0
    >>> how_many_times('aaa', 'a')
    3
    >>> how_many_times('aaaa', 'aa')
    3
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
times = 0

    for i in range(len(string) - len(substring) + 1):
        if string[i:i+len(substring)] == substring:
            times += 1

    return times
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["";enlist["x"]] = 0];
    .qython.assert[candidate["xyxyxyx";enlist["x"]] = 4];
    .qython.assert[candidate["cacacacac";"cac"] = 4];
    .qython.assert[(candidate["john doe";"john"]) = 1]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:18 -->
================================================================================

<!-- PROBLEM_START:19 -->
# Problem 19

<!-- META_START -->
**Task ID:** HumanEval/19
**Entry Point:** sort_numbers
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def sort_numbers(numbers: str) -> str:
    """ Input is a space-delimited string of numberals from 'zero' to 'nine'.
    Valid choices are 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight' and 'nine'.
    Return the string with numbers sorted from smallest to largest
    >>> sort_numbers('three one five')
    'one three five'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
value_map = {
        'zero': 0,
        'one': 1,
        'two': 2,
        'three': 3,
        'four': 4,
        'five': 5,
        'six': 6,
        'seven': 7,
        'eight': 8,
        'nine': 9
    }
    return ' '.join(sorted([x for x in numbers.split(' ') if x], key=lambda x: value_map[x]))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = ""];
    .qython.assert[candidate["three"] = "three"];
    .qython.assert[(candidate["three five nine"]) = ("three five nine")];
    .qython.assert[(candidate["five zero four seven nine eight"]) = ("zero four five seven eight nine")];
    .qython.assert[(candidate["six five four three two one zero"]) = ("zero one two three four five six")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:19 -->
================================================================================

<!-- PROBLEM_START:20 -->
# Problem 20

<!-- META_START -->
**Task ID:** HumanEval/20
**Entry Point:** find_closest_elements
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List, Tuple


def find_closest_elements(numbers: List[float]) -> Tuple[float, float]:
    """ From a supplied list of numbers (of length at least two) select and return two that are the closest to each
    other and return them in order (smaller number, larger number).
    >>> find_closest_elements([1.0, 2.0, 3.0, 4.0, 5.0, 2.2])
    (2.0, 2.2)
    >>> find_closest_elements([1.0, 2.0, 3.0, 4.0, 5.0, 2.0])
    (2.0, 2.0)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
closest_pair = None
    distance = None

    for idx, elem in enumerate(numbers):
        for idx2, elem2 in enumerate(numbers):
            if idx != idx2:
                if distance is None:
                    distance = abs(elem - elem2)
                    closest_pair = tuple(sorted([elem, elem2]))
                else:
                    new_distance = abs(elem - elem2)
                    if new_distance < distance:
                        distance = new_distance
                        closest_pair = tuple(sorted([elem, elem2]))

    return closest_pair
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1.0;2.0;3.9;4.0;5.0;2.2)] = (3.9;4.0)];
    .qython.assert[candidate[(1.0;2.0;5.9;4.0;5.0)] = (5.0;5.9)];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0;2.2)] = (2.0;2.2)];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0;2.0)] = (2.0;2.0)];
    .qython.assert[candidate[(1.1;2.2;3.1;4.1;5.1)] = (2.2;3.1)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:20 -->
================================================================================

<!-- PROBLEM_START:21 -->
# Problem 21

<!-- META_START -->
**Task ID:** HumanEval/21
**Entry Point:** rescale_to_unit
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def rescale_to_unit(numbers: List[float]) -> List[float]:
    """ Given list of numbers (of at least two elements), apply a linear transform to that list,
    such that the smallest number will become 0 and the largest will become 1
    >>> rescale_to_unit([1.0, 2.0, 3.0, 4.0, 5.0])
    [0.0, 0.25, 0.5, 0.75, 1.0]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
min_number = min(numbers)
    max_number = max(numbers)
    return [(x - min_number) / (max_number - min_number) for x in numbers]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(2.0;49.9)] = (0.0;1.0)];
    .qython.assert[candidate[(100.0;49.9)] = (1.0;0.0)];
    .qython.assert[candidate[(1.0;2.0;3.0;4.0;5.0)] = (0.0;0.25;0.5;0.75;1.0)];
    .qython.assert[candidate[(2.0;1.0;5.0;3.0;4.0)] = (0.25;0.0;1.0;0.5;0.75)];
    .qython.assert[candidate[(12.0;11.0;15.0;13.0;14.0)] = (0.25;0.0;1.0;0.5;0.75)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:21 -->
================================================================================

<!-- PROBLEM_START:22 -->
# Problem 22

<!-- META_START -->
**Task ID:** HumanEval/22
**Entry Point:** filter_integers
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List, Any


def filter_integers(values: List[Any]) -> List[int]:
    """ Filter given list of any python values only for integers
    >>> filter_integers(['a', 3.14, 5])
    [5]
    >>> filter_integers([1, 2, 3, 'abc', {}, []])
    [1, 2, 3]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [x for x in values if isinstance(x, int)]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(4;()!();();23.2;9;"adasd")] = (4;9)];
    .qython.assert[candidate[(3;enlist["c"];3;3;enlist["a"];enlist["b"])] = (3;3;3)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:22 -->
================================================================================

<!-- PROBLEM_START:23 -->
# Problem 23

<!-- META_START -->
**Task ID:** HumanEval/23
**Entry Point:** strlen
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def strlen(string: str) -> int:
    """ Return length of given string
    >>> strlen('')
    0
    >>> strlen('abc')
    3
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return len(string)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = 0];
    .qython.assert[candidate[enlist["x"]] = 1];
    .qython.assert[candidate["asdasnakj"] = 9]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:23 -->
================================================================================

<!-- PROBLEM_START:24 -->
# Problem 24

<!-- META_START -->
**Task ID:** HumanEval/24
**Entry Point:** largest_divisor
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def largest_divisor(n: int) -> int:
    """ For a given number n, find the largest number that divides n evenly, smaller than n
    >>> largest_divisor(15)
    5
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
for i in reversed(range(n)):
        if n % i == 0:
            return i
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[3] = 1];
    .qython.assert[candidate[7] = 1];
    .qython.assert[candidate[10] = 5];
    .qython.assert[candidate[100] = 50];
    .qython.assert[candidate[49] = 7]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:24 -->
================================================================================

<!-- PROBLEM_START:25 -->
# Problem 25

<!-- META_START -->
**Task ID:** HumanEval/25
**Entry Point:** factorize
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def factorize(n: int) -> List[int]:
    """ Return list of prime factors of given integer in the order from smallest to largest.
    Each of the factors should be listed number of times corresponding to how many times it appeares in factorization.
    Input number should be equal to the product of all factors
    >>> factorize(8)
    [2, 2, 2]
    >>> factorize(25)
    [5, 5]
    >>> factorize(70)
    [2, 5, 7]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import math
    fact = []
    i = 2
    while i <= int(math.sqrt(n) + 1):
        if n % i == 0:
            fact.append(i)
            n //= i
        else:
            i += 1

    if n > 1:
        fact.append(n)
    return fact
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[2] = enlist 2];
    .qython.assert[candidate[4] = (2;2)];
    .qython.assert[candidate[8] = (2;2;2)];
    .qython.assert[candidate[3*19] = (3;19)];
    .qython.assert[candidate[((3*19)*3)*19] = (3;3;19;19)];
    .qython.assert[candidate[((((3*19)*3)*19)*3)*19] = (3;3;3;19;19;19)];
    .qython.assert[candidate[((3*19)*19)*19] = (3;19;19;19)];
    .qython.assert[candidate[(3*2)*3] = (2;3;3)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:25 -->
================================================================================

<!-- PROBLEM_START:26 -->
# Problem 26

<!-- META_START -->
**Task ID:** HumanEval/26
**Entry Point:** remove_duplicates
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def remove_duplicates(numbers: List[int]) -> List[int]:
    """ From a list of integers, remove all elements that occur more than once.
    Keep order of elements left the same as in the input.
    >>> remove_duplicates([1, 2, 3, 2, 4])
    [1, 3, 4]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import collections
    c = collections.Counter(numbers)
    return [n for n in numbers if c[n] <= 1]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;2;3;4)] = (1;2;3;4)];
    .qython.assert[candidate[(1;2;3;2;4;3;5)] = (1;4;5)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:26 -->
================================================================================

<!-- PROBLEM_START:27 -->
# Problem 27

<!-- META_START -->
**Task ID:** HumanEval/27
**Entry Point:** flip_case
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def flip_case(string: str) -> str:
    """ For a given string, flip lowercase characters to uppercase and uppercase to lowercase.
    >>> flip_case('Hello')
    'hELLO'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return string.swapcase()
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = ""];
    .qython.assert[candidate["Hello!"] = "hELLO!"];
    .qython.assert[(candidate["These violent delights have violent ends"]) = ("tHESE VIOLENT DELIGHTS HAVE VIOLENT ENDS")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:27 -->
================================================================================

<!-- PROBLEM_START:28 -->
# Problem 28

<!-- META_START -->
**Task ID:** HumanEval/28
**Entry Point:** concatenate
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def concatenate(strings: List[str]) -> str:
    """ Concatenate list of strings into a single string
    >>> concatenate([])
    ''
    >>> concatenate(['a', 'b', 'c'])
    'abc'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return ''.join(strings)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = ""];
    .qython.assert[candidate[(enlist["x"];enlist["y"];enlist["z"])] = "xyz"];
    .qython.assert[candidate[(enlist["x"];enlist["y"];enlist["z"];enlist["w"];enlist["k"])] = "xyzwk"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:28 -->
================================================================================

<!-- PROBLEM_START:29 -->
# Problem 29

<!-- META_START -->
**Task ID:** HumanEval/29
**Entry Point:** filter_by_prefix
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
from typing import List


def filter_by_prefix(strings: List[str], prefix: str) -> List[str]:
    """ Filter an input list of strings only for ones that start with a given prefix.
    >>> filter_by_prefix([], 'a')
    []
    >>> filter_by_prefix(['abc', 'bcd', 'cde', 'array'], 'a')
    ['abc', 'array']
    >>> filter_by_prefix(['java','javascript','python','more javascript'], 'java')
    ['java', 'javascript']
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [x for x in strings if x.startswith(prefix)]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[();"john"] = ()];
    .qython.assert[(candidate[("xxx";"asd";"xxy";"john doe";"xxxAAA";"xxx");"xxx"]) = ("xxx";"xxxAAA";"xxx")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:29 -->
================================================================================

<!-- PROBLEM_START:30 -->
# Problem 30

<!-- META_START -->
**Task ID:** HumanEval/30
**Entry Point:** get_positive
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def get_positive(l: list):
    """Return only positive numbers in the list.
    >>> get_positive([-1, 2, -4, 5, 6])
    [2, 5, 6]
    >>> get_positive([5, 3, -5, 2, -3, 3, 9, 0, 123, 1, -10])
    [5, 3, 2, 3, 9, 123, 1]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [e for e in l if e > 0]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(-1;-2;4;5;6)] = (4;5;6)];
    .qython.assert[candidate[(5;3;-5;2;3;3;9;0;123;1;-10)] = (5;3;2;3;3;9;123;1)];
    .qython.assert[count[candidate[(-1;-2)]] = 0];
    .qython.assert[count[candidate[()]] = 0]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:30 -->
================================================================================

<!-- PROBLEM_START:31 -->
# Problem 31

<!-- META_START -->
**Task ID:** HumanEval/31
**Entry Point:** is_prime
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_prime(n):
    """Return true if a given number is prime, and false otherwise.
    >>> is_prime(6)
    False
    >>> is_prime(101)
    True
    >>> is_prime(11)
    True
    >>> is_prime(13441)
    True
    >>> is_prime(61)
    True
    >>> is_prime(4)
    False
    >>> is_prime(1)
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n < 2:
        return False
    for k in range(2, n - 1):
        if n % k == 0:
            return False
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[6] = 0b];
    .qython.assert[candidate[101] = 1b];
    .qython.assert[candidate[11] = 1b];
    .qython.assert[candidate[13441] = 1b];
    .qython.assert[candidate[61] = 1b];
    .qython.assert[candidate[4] = 0b];
    .qython.assert[candidate[1] = 0b];
    .qython.assert[candidate[5] = 1b];
    .qython.assert[candidate[11] = 1b];
    .qython.assert[candidate[17] = 1b];
    .qython.assert[candidate[5*17] = 0b];
    .qython.assert[candidate[11*7] = 0b];
    .qython.assert[candidate[13441*19] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:31 -->
================================================================================

<!-- PROBLEM_START:32 -->
# Problem 32

<!-- META_START -->
**Task ID:** HumanEval/32
**Entry Point:** find_zero
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
import numpy as np


def poly(xs: list, x: float):
    """
    Evaluates polynomial with coefficients xs at point x.
    return xs[0] + xs[1] * x + xs[1] * x^2 + .... xs[n] * x^n
    """
    return np.dot(xs, x ** np.arange(len(xs)))


def find_zero(xs: list):
    """ xs are coefficients of a polynomial.
    find_zero find x such that poly(x) = 0.
    find_zero returns only only zero point, even if there are many.
    Moreover, the test cases will only provide polynomials with an even number of real coefficients and non-zero leading
    coefficient, which guarantees a real root exists.
    >>> round(find_zero([1, 2]), 2) # f(x) = 1 + 2x
    -0.5
    >>> round(find_zero([-6, 11, -6, 1]), 2) # (x - 1) * (x - 2) * (x - 3) = -6 + 11x - 6x^2 + x^3
    1.0
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
begin, end = -1., 1.
    while poly(xs, begin) * poly(xs, end) > 0:
        begin *= 2.0
        end *= 2.0
    while end - begin > 1e-10:
        center = (begin + end) / 2.0
        if poly(xs, center) * poly(xs, begin) > 0:
            begin = center
        else:
            end = center
    return begin
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    system["S ",.qython.String 42];
    do[100;
        ncoeff:2*.qython.randint[1;5];
        coeffs:();
        do[ncoeff;
            coeff:.qython.randint[-10;11];
            if[coeff = 0;
                coeff:1
                ];
            coeffs,:coeff
            ];
        solution:candidate[coeffs];
        .qython.assert[abs[poly[coeffs;solution]] < 1e-4]
        ]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:32 -->
================================================================================

<!-- PROBLEM_START:33 -->
# Problem 33

<!-- META_START -->
**Task ID:** HumanEval/33
**Entry Point:** sort_third
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sort_third(l: list):
    """This function takes a list l and returns a list l' such that
    l' is identical to l in the indices that are not divisible by three, while its values at the indices that are divisible by three are equal
    to the values of the corresponding indices of l, but sorted.
    >>> sort_third([1, 2, 3])
    [1, 2, 3]
    >>> sort_third([5, 6, 3, 4, 8, 9, 2])
    [2, 6, 3, 4, 8, 9, 5]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
l = list(l)
    l[::3] = sorted(l[::3])
    return l
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    tuple:{[x] x};
    .qython.assert[tuple[candidate[(1;2;3)]] = tuple[sort_third[(1;2;3)]]];
    .qython.assert[tuple[candidate[(5;3;-5;2;-3;3;9;0;123;1;-10)]] = tuple[sort_third[(5;3;-5;2;-3;3;9;0;123;1;-10)]]];
    .qython.assert[tuple[candidate[(5;8;-12;4;23;2;3;11;12;-10)]] = tuple[sort_third[(5;8;-12;4;23;2;3;11;12;-10)]]];
    .qython.assert[tuple[candidate[(5;6;3;4;8;9;2)]] = tuple[(2;6;3;4;8;9;5)]];
    .qython.assert[tuple[candidate[(5;8;3;4;6;9;2)]] = tuple[(2;8;3;4;6;9;5)]];
    .qython.assert[tuple[candidate[(5;6;9;4;8;3;2)]] = tuple[(2;6;9;4;8;3;5)]];
    .qython.assert[tuple[candidate[(5;6;3;4;8;9;2;1)]] = tuple[(2;6;3;4;8;9;5;1)]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:33 -->
================================================================================

<!-- PROBLEM_START:34 -->
# Problem 34

<!-- META_START -->
**Task ID:** HumanEval/34
**Entry Point:** unique
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def unique(l: list):
    """Return sorted unique elements in a list
    >>> unique([5, 3, 5, 2, 3, 3, 9, 0, 123])
    [0, 2, 3, 5, 9, 123]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sorted(list(set(l)))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(5;3;5;2;3;3;9;0;123)] = (0;2;3;5;9;123)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:34 -->
================================================================================

<!-- PROBLEM_START:35 -->
# Problem 35

<!-- META_START -->
**Task ID:** HumanEval/35
**Entry Point:** max_element
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def max_element(l: list):
    """Return maximum element in the list.
    >>> max_element([1, 2, 3])
    3
    >>> max_element([5, 3, -5, 2, -3, 3, 9, 0, 123, 1, -10])
    123
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
m = l[0]
    for e in l:
        if e > m:
            m = e
    return m
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;3)] = 3];
    .qython.assert[candidate[(5;3;-5;2;-3;3;9;0;124;1;-10)] = 124]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:35 -->
================================================================================

<!-- PROBLEM_START:36 -->
# Problem 36

<!-- META_START -->
**Task ID:** HumanEval/36
**Entry Point:** fizz_buzz
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def fizz_buzz(n: int):
    """Return the number of times the digit 7 appears in integers less than n which are divisible by 11 or 13.
    >>> fizz_buzz(50)
    0
    >>> fizz_buzz(78)
    2
    >>> fizz_buzz(79)
    3
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ns = []
    for i in range(n):
        if i % 11 == 0 or i % 13 == 0:
            ns.append(i)
    s = ''.join(list(map(str, ns)))
    ans = 0
    for c in s:
        ans += (c == '7')
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[50] = 0];
    .qython.assert[candidate[78] = 2];
    .qython.assert[candidate[79] = 3];
    .qython.assert[candidate[100] = 3];
    .qython.assert[candidate[200] = 6];
    .qython.assert[candidate[4000] = 192];
    .qython.assert[candidate[10000] = 639];
    .qython.assert[candidate[100000] = 8026]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:36 -->
================================================================================

<!-- PROBLEM_START:37 -->
# Problem 37

<!-- META_START -->
**Task ID:** HumanEval/37
**Entry Point:** sort_even
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sort_even(l: list):
    """This function takes a list l and returns a list l' such that
    l' is identical to l in the odd indices, while its values at the even indices are equal
    to the values of the even indices of l, but sorted.
    >>> sort_even([1, 2, 3])
    [1, 2, 3]
    >>> sort_even([5, 6, 3, 4])
    [3, 6, 5, 4]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
evens = l[::2]
    odds = l[1::2]
    evens.sort()
    ans = []
    for e, o in zip(evens, odds):
        ans.extend([e, o])
    if len(evens) > len(odds):
        ans.append(evens[-1])
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    tuple:{[x] x};
    .qython.assert[tuple[candidate[(1;2;3)]] = tuple[(1;2;3)]];
    .qython.assert[tuple[candidate[(5;3;-5;2;-3;3;9;0;123;1;-10)]] = tuple[(-10;3;-5;2;-3;3;5;0;9;1;123)]];
    .qython.assert[tuple[candidate[(5;8;-12;4;23;2;3;11;12;-10)]] = tuple[(-12;8;3;4;5;2;12;11;23;-10)]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:37 -->
================================================================================

<!-- PROBLEM_START:38 -->
# Problem 38

<!-- META_START -->
**Task ID:** HumanEval/38
**Entry Point:** decode_cyclic
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def encode_cyclic(s: str):
    """
    returns encoded string by cycling groups of three characters.
    """
    # split string to groups. Each of length 3.
    groups = [s[(3 * i):np.min([(3 * i + 3), len(s)])] for i in range((len(s) + 2) // 3)]
    # cycle elements in each group. Unless group has fewer elements than 3.
    groups = [np.concatenate([grp[1:], grp[0]]) if len(grp) == 3 else grp for grp in groups]
    return "".join(groups)


def decode_cyclic(s: str):
    """
    takes as input string encoded with encode_cyclic function. Returns decoded string.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return encode_cyclic(encode_cyclic(s))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    encode_cyclic:{[s]
        "
        returns encoded string by cycling groups of three characters.
        ";
        groups:{[s;i] .qython.slice[s;3*i;min[((3*i)+3;count[s])];0N]}[s] each (.qython.arange[(count[s]+2) div 3]);
        groups:{[grp] $[count[grp] = 3;(raze[(1 _ grp;grp[0])]);grp]} each groups;
        :.qython.join[""; groups]
        };
    system["S ",.qython.String 42];
    letters:.Q.a;
    do[100;
        s:.qython.join[""; {[letters;i] rand[letters]}[letters] each .qython.arange[.qython.randint[10;21]]];
        encoded_str:encode_cyclic[s];
        .qython.assert[candidate[encoded_str] = s]
        ]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:38 -->
================================================================================

<!-- PROBLEM_START:39 -->
# Problem 39

<!-- META_START -->
**Task ID:** HumanEval/39
**Entry Point:** prime_fib
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def prime_fib(n: int):
    """
    prime_fib returns n-th number that is a Fibonacci number and it's also prime.
    >>> prime_fib(1)
    2
    >>> prime_fib(2)
    3
    >>> prime_fib(3)
    5
    >>> prime_fib(4)
    13
    >>> prime_fib(5)
    89
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import math

    def is_prime(p):
        if p < 2:
            return False
        for k in range(2, min(int(math.sqrt(p)) + 1, p - 1)):
            if p % k == 0:
                return False
        return True
    f = [0, 1]
    while True:
        f.append(f[-1] + f[-2])
        if is_prime(f[-1]):
            n -= 1
        if n == 0:
            return f[-1]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[1] = 2];
    .qython.assert[candidate[2] = 3];
    .qython.assert[candidate[3] = 5];
    .qython.assert[candidate[4] = 13];
    .qython.assert[candidate[5] = 89];
    .qython.assert[candidate[6] = 233];
    .qython.assert[candidate[7] = 1597];
    .qython.assert[candidate[8] = 28657];
    .qython.assert[candidate[9] = 514229];
    .qython.assert[candidate[10] = 433494437]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:39 -->
================================================================================

<!-- PROBLEM_START:40 -->
# Problem 40

<!-- META_START -->
**Task ID:** HumanEval/40
**Entry Point:** triples_sum_to_zero
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def triples_sum_to_zero(l: list):
    """
    triples_sum_to_zero takes a list of integers as an input.
    it returns True if there are three distinct elements in the list that
    sum to zero, and False otherwise.

    >>> triples_sum_to_zero([1, 3, 5, 0])
    False
    >>> triples_sum_to_zero([1, 3, -2, 1])
    True
    >>> triples_sum_to_zero([1, 2, 3, 7])
    False
    >>> triples_sum_to_zero([2, 4, -5, 3, 9, 7])
    True
    >>> triples_sum_to_zero([1])
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
for i in range(len(l)):
        for j in range(i + 1, len(l)):
            for k in range(j + 1, len(l)):
                if l[i] + l[j] + l[k] == 0:
                    return True
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;3;5;0)] = 0b];
    .qython.assert[candidate[(1;3;5;-1)] = 0b];
    .qython.assert[candidate[(1;3;-2;1)] = 1b];
    .qython.assert[candidate[(1;2;3;7)] = 0b];
    .qython.assert[candidate[(1;2;5;7)] = 0b];
    .qython.assert[candidate[(2;4;-5;3;9;7)] = 1b];
    .qython.assert[(candidate[enlist 1]) = 0b];
    .qython.assert[candidate[(1;3;5;-100)] = 0b];
    .qython.assert[candidate[(100;3;5;-100)] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:40 -->
================================================================================

<!-- PROBLEM_START:41 -->
# Problem 41

<!-- META_START -->
**Task ID:** HumanEval/41
**Entry Point:** car_race_collision
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def car_race_collision(n: int):
    """
    Imagine a road that's a perfectly straight infinitely long line.
    n cars are driving left to right;  simultaneously, a different set of n cars
    are driving right to left.   The two sets of cars start out being very far from
    each other.  All cars move in the same speed.  Two cars are said to collide
    when a car that's moving left to right hits a car that's moving right to left.
    However, the cars are infinitely sturdy and strong; as a result, they continue moving
    in their trajectory as if they did not collide.

    This function outputs the number of such collisions.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return n**2
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[2] = 4];
    .qython.assert[candidate[3] = 9];
    .qython.assert[candidate[4] = 16];
    .qython.assert[candidate[8] = 64];
    .qython.assert[candidate[10] = 100]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:41 -->
================================================================================

<!-- PROBLEM_START:42 -->
# Problem 42

<!-- META_START -->
**Task ID:** HumanEval/42
**Entry Point:** incr_list
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def incr_list(l: list):
    """Return list with elements incremented by 1.
    >>> incr_list([1, 2, 3])
    [2, 3, 4]
    >>> incr_list([5, 3, 5, 2, 3, 3, 9, 0, 123])
    [6, 4, 6, 3, 4, 4, 10, 1, 124]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [(e + 1) for e in l]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(3;2;1)] = (4;3;2)];
    .qython.assert[candidate[(5;2;5;2;3;3;9;0;123)] = (6;3;6;3;4;4;10;1;124)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:42 -->
================================================================================

<!-- PROBLEM_START:43 -->
# Problem 43

<!-- META_START -->
**Task ID:** HumanEval/43
**Entry Point:** pairs_sum_to_zero
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def pairs_sum_to_zero(l):
    """
    pairs_sum_to_zero takes a list of integers as an input.
    it returns True if there are two distinct elements in the list that
    sum to zero, and False otherwise.
    >>> pairs_sum_to_zero([1, 3, 5, 0])
    False
    >>> pairs_sum_to_zero([1, 3, -2, 1])
    False
    >>> pairs_sum_to_zero([1, 2, 3, 7])
    False
    >>> pairs_sum_to_zero([2, 4, -5, 3, 5, 7])
    True
    >>> pairs_sum_to_zero([1])
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
for i, l1 in enumerate(l):
        for j in range(i + 1, len(l)):
            if l1 + l[j] == 0:
                return True
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;3;5;0)] = 0b];
    .qython.assert[candidate[(1;3;-2;1)] = 0b];
    .qython.assert[candidate[(1;2;3;7)] = 0b];
    .qython.assert[candidate[(2;4;-5;3;5;7)] = 1b];
    .qython.assert[(candidate[enlist 1]) = 0b];
    .qython.assert[candidate[(-3;9;-1;3;2;30)] = 1b];
    .qython.assert[candidate[(-3;9;-1;3;2;31)] = 1b];
    .qython.assert[candidate[(-3;9;-1;4;2;30)] = 0b];
    .qython.assert[candidate[(-3;9;-1;4;2;31)] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:43 -->
================================================================================

<!-- PROBLEM_START:44 -->
# Problem 44

<!-- META_START -->
**Task ID:** HumanEval/44
**Entry Point:** change_base
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def change_base(x: int, base: int):
    """Change numerical base of input number x to base.
    return string representation after the conversion.
    base numbers are less than 10.
    >>> change_base(8, 3)
    '22'
    >>> change_base(8, 2)
    '1000'
    >>> change_base(7, 2)
    '111'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ret = ""
    while x > 0:
        ret = str(x % base) + ret
        x //= base
    return ret
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[8;3] = "22"];
    .qython.assert[candidate[9;3] = "100"];
    .qython.assert[candidate[234;2] = "11101010"];
    .qython.assert[candidate[16;2] = "10000"];
    .qython.assert[candidate[8;2] = "1000"];
    .qython.assert[candidate[7;2] = "111"];
    x:2;
    while[x < 8;
        .qython.assert[candidate[x;x+1] = .qython.String[x]];
        x+:1
        ]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:44 -->
================================================================================

<!-- PROBLEM_START:45 -->
# Problem 45

<!-- META_START -->
**Task ID:** HumanEval/45
**Entry Point:** triangle_area
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def triangle_area(a, h):
    """Given length of a side and high return area for a triangle.
    >>> triangle_area(5, 3)
    7.5
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return a * h / 2.0
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5;3] = 7.5];
    .qython.assert[candidate[2;2] = 2.0];
    .qython.assert[candidate[10;8] = 40.0]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:45 -->
================================================================================

<!-- PROBLEM_START:46 -->
# Problem 46

<!-- META_START -->
**Task ID:** HumanEval/46
**Entry Point:** fib4
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def fib4(n: int):
    """The Fib4 number sequence is a sequence similar to the Fibbonacci sequnece that's defined as follows:
    fib4(0) -> 0
    fib4(1) -> 0
    fib4(2) -> 2
    fib4(3) -> 0
    fib4(n) -> fib4(n-1) + fib4(n-2) + fib4(n-3) + fib4(n-4).
    Please write a function to efficiently compute the n-th element of the fib4 number sequence.  Do not use recursion.
    >>> fib4(5)
    4
    >>> fib4(6)
    8
    >>> fib4(7)
    14
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
results = [0, 0, 2, 0]
    if n < 4:
        return results[n]

    for _ in range(4, n + 1):
        results.append(results[-1] + results[-2] + results[-3] + results[-4])
        results.pop(0)

    return results[-1]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5] = 4];
    .qython.assert[candidate[8] = 28];
    .qython.assert[candidate[10] = 104];
    .qython.assert[candidate[12] = 386]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:46 -->
================================================================================

<!-- PROBLEM_START:47 -->
# Problem 47

<!-- META_START -->
**Task ID:** HumanEval/47
**Entry Point:** median
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def median(l: list):
    """Return median of elements in the list l.
    >>> median([3, 1, 2, 4, 5])
    3
    >>> median([-10, 4, 6, 1000, 10, 20])
    15.0
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
l = sorted(l)
    if len(l) % 2 == 1:
        return l[len(l) // 2]
    else:
        return (l[len(l) // 2 - 1] + l[len(l) // 2]) / 2.0
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(3;1;2;4;5)] = 3];
    .qython.assert[candidate[(-10;4;6;1000;10;20)] = 8.0];
    .qython.assert[(candidate[enlist 5]) = 5];
    .qython.assert[candidate[(6;5)] = 5.5];
    .qython.assert[candidate[(8;1;3;9;9;2;7)] = 7]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:47 -->
================================================================================

<!-- PROBLEM_START:48 -->
# Problem 48

<!-- META_START -->
**Task ID:** HumanEval/48
**Entry Point:** is_palindrome
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_palindrome(text: str):
    """
    Checks if given string is a palindrome
    >>> is_palindrome('')
    True
    >>> is_palindrome('aba')
    True
    >>> is_palindrome('aaaaa')
    True
    >>> is_palindrome('zbcd')
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
for i in range(len(text)):
        if text[i] != text[len(text) - 1 - i]:
            return False
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = 1b];
    .qython.assert[candidate["aba"] = 1b];
    .qython.assert[candidate["aaaaa"] = 1b];
    .qython.assert[candidate["zbcd"] = 0b];
    .qython.assert[candidate["xywyx"] = 1b];
    .qython.assert[candidate["xywyz"] = 0b];
    .qython.assert[candidate["xywzx"] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:48 -->
================================================================================

<!-- PROBLEM_START:49 -->
# Problem 49

<!-- META_START -->
**Task ID:** HumanEval/49
**Entry Point:** modp
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def modp(n: int, p: int):
    """Return 2^n modulo p (be aware of numerics).
    >>> modp(3, 5)
    3
    >>> modp(1101, 101)
    2
    >>> modp(0, 101)
    1
    >>> modp(3, 11)
    8
    >>> modp(100, 101)
    1
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ret = 1
    for i in range(n):
        ret = (2 * ret) % p
    return ret
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[3;5] = 3];
    .qython.assert[candidate[1101;101] = 2];
    .qython.assert[candidate[0;101] = 1];
    .qython.assert[candidate[3;11] = 8];
    .qython.assert[candidate[100;101] = 1];
    .qython.assert[candidate[30;5] = 4];
    .qython.assert[candidate[31;5] = 3]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:49 -->
================================================================================

<!-- PROBLEM_START:50 -->
# Problem 50

<!-- META_START -->
**Task ID:** HumanEval/50
**Entry Point:** decode_shift
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def encode_shift(s: str):
    """
    returns encoded string by shifting every character by 5 in the alphabet.
    """
    return "".join([chr(((ord(ch) + 5 - ord("a")[0]) % 26) + ord("a")[0]) for ch in s])


def decode_shift(s: str):
    """
    takes as input string encoded with encode_shift function. Returns decoded string.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return "".join([chr(((ord(ch) - 5 - ord("a")) % 26) + ord("a")) for ch in s])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    system["S ",.qython.String 42];
    encode_shift:{[s]
        "
        returns encoded string by shifting every character by 5 in the alphabet.
        ";
        :.qython.join[""; {[ch] (.qython.chr[(((.qython.ord[ch]+5)-.qython.ord[enlist["a"]][0]) mod 26)+.qython.ord[enlist["a"]][0]])} each s]
        };
    letters:.Q.a;
    do[100;
        .qython.str:.qython.join[""; {[letters;i] rand[letters]}[letters] each .qython.arange[.qython.randint[10;21]]];
        encoded_str:encode_shift[.qython.str];
        .qython.assert[candidate[encoded_str] = .qython.str]
        ]
    }
/ 'str' is a reserved built-in function. Using it as an assignment target in: .qython.str:.qython.join[""; {[letters;i] rand[letters]}[letters] each .qython.arange[.qython.randint[10;21]]] may cause unexpected behavior or conflicts.
```
<!-- TEST_END -->

<!-- PROBLEM_END:50 -->
================================================================================

<!-- PROBLEM_START:51 -->
# Problem 51

<!-- META_START -->
**Task ID:** HumanEval/51
**Entry Point:** remove_vowels
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def remove_vowels(text):
    """
    remove_vowels is a function that takes string and returns string without vowels.
    >>> remove_vowels('')
    ''
    >>> remove_vowels("abcdef\nghijklm")
    'bcdf\nghjklm'
    >>> remove_vowels('abcdef')
    'bcdf'
    >>> remove_vowels('aaaaa')
    ''
    >>> remove_vowels('aaBAA')
    'B'
    >>> remove_vowels('zbcd')
    'zbcd'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return "".join([s for s in text if s.lower() not in ["a", "e", "i", "o", "u"]])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[""] = ""];
    .qython.assert[candidate["abcdef\nghijklm"] = "bcdf\nghjklm"];
    .qython.assert[candidate["fedcba"] = "fdcb"];
    .qython.assert[candidate["eeeee"] = ""];
    .qython.assert[candidate["acBAA"] = "cB"];
    .qython.assert[candidate["EcBOO"] = "cB"];
    .qython.assert[candidate["ybcd"] = "ybcd"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:51 -->
================================================================================

<!-- PROBLEM_START:52 -->
# Problem 52

<!-- META_START -->
**Task ID:** HumanEval/52
**Entry Point:** below_threshold
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def below_threshold(l: list, t: int):
    """Return True if all numbers in the list l are below threshold t.
    >>> below_threshold([1, 2, 4, 10], 100)
    True
    >>> below_threshold([1, 20, 4, 10], 5)
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
for e in l:
        if e >= t:
            return False
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;4;10);100]];
    .qython.assert[not candidate[(1;20;4;10);5]];
    .qython.assert[candidate[(1;20;4;10);21]];
    .qython.assert[candidate[(1;20;4;10);22]];
    .qython.assert[candidate[(1;8;4;10);11]];
    .qython.assert[not candidate[(1;8;4;10);10]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:52 -->
================================================================================

<!-- PROBLEM_START:53 -->
# Problem 53

<!-- META_START -->
**Task ID:** HumanEval/53
**Entry Point:** add
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def add(x: int, y: int):
    """Add two numbers x and y
    >>> add(2, 3)
    5
    >>> add(5, 7)
    12
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return x + y
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    system["S ",.qython.String 42];
    .qython.assert[candidate[0;1] = 1];
    .qython.assert[candidate[1;0] = 1];
    .qython.assert[candidate[2;3] = 5];
    .qython.assert[candidate[5;7] = 12];
    .qython.assert[candidate[7;5] = 12];
    do[100;
        (x;y):(.qython.randint[0;1001];.qython.randint[0;1001]);
        .qython.assert[candidate[x;y] = x+y]
        ]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:53 -->
================================================================================

<!-- PROBLEM_START:54 -->
# Problem 54

<!-- META_START -->
**Task ID:** HumanEval/54
**Entry Point:** same_chars
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def same_chars(s0: str, s1: str):
    """
    Check if two words have the same characters.
    >>> same_chars('eabcdzzzz', 'dddzzzzzzzddeddabc')
    True
    >>> same_chars('abcd', 'dddddddabc')
    True
    >>> same_chars('dddddddabc', 'abcd')
    True
    >>> same_chars('eabcd', 'dddddddabc')
    False
    >>> same_chars('abcd', 'dddddddabce')
    False
    >>> same_chars('eabcdzzzz', 'dddzzzzzzzddddabc')
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return set(s0) == set(s1)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["eabcdzzzz";"dddzzzzzzzddeddabc"] = 1b];
    .qython.assert[candidate["abcd";"dddddddabc"] = 1b];
    .qython.assert[candidate["dddddddabc";"abcd"] = 1b];
    .qython.assert[candidate["eabcd";"dddddddabc"] = 0b];
    .qython.assert[candidate["abcd";"dddddddabcf"] = 0b];
    .qython.assert[candidate["eabcdzzzz";"dddzzzzzzzddddabc"] = 0b];
    .qython.assert[candidate["aabb";"aaccc"] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:54 -->
================================================================================

<!-- PROBLEM_START:55 -->
# Problem 55

<!-- META_START -->
**Task ID:** HumanEval/55
**Entry Point:** fib
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def fib(n: int):
    """Return n-th Fibonacci number.
    >>> fib(10)
    55
    >>> fib(1)
    1
    >>> fib(8)
    21
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n == 0:
        return 0
    if n == 1:
        return 1
    return fib(n - 1) + fib(n - 2)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[10] = 55];
    .qython.assert[candidate[1] = 1];
    .qython.assert[candidate[8] = 21];
    .qython.assert[candidate[11] = 89];
    .qython.assert[candidate[12] = 144]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:55 -->
================================================================================

<!-- PROBLEM_START:56 -->
# Problem 56

<!-- META_START -->
**Task ID:** HumanEval/56
**Entry Point:** correct_bracketing
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def correct_bracketing(brackets: str):
    """ brackets is a string of "<" and ">".
    return True if every opening bracket has a corresponding closing bracket.

    >>> correct_bracketing("<")
    False
    >>> correct_bracketing("<>")
    True
    >>> correct_bracketing("<<><>>")
    True
    >>> correct_bracketing("><<>")
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
depth = 0
    for b in brackets:
        if b == "<":
            depth += 1
        else:
            depth -= 1
        if depth < 0:
            return False
    return depth == 0
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["<>"]];
    .qython.assert[candidate["<<><>>"]];
    .qython.assert[candidate["<><><<><>><>"]];
    .qython.assert[candidate["<><><<<><><>><>><<><><<>>>"]];
    .qython.assert[not candidate["<<<><>>>>"]];
    .qython.assert[not candidate["><<>"]];
    .qython.assert[not candidate[enlist["<"]]];
    .qython.assert[not candidate["<<<<"]];
    .qython.assert[not candidate[enlist[">"]]];
    .qython.assert[not candidate["<<>"]];
    .qython.assert[not candidate["<><><<><>><>><<>"]];
    .qython.assert[not candidate["<><><<><>><>>><>"]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:56 -->
================================================================================

<!-- PROBLEM_START:57 -->
# Problem 57

<!-- META_START -->
**Task ID:** HumanEval/57
**Entry Point:** monotonic
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def monotonic(l: list):
    """Return True is list elements are monotonically increasing or decreasing.
    >>> monotonic([1, 2, 4, 20])
    True
    >>> monotonic([1, 20, 4, 10])
    False
    >>> monotonic([4, 1, 0, -10])
    True
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if l == sorted(l) or l == sorted(l, reverse=True):
        return True
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;4;10)] = 1b];
    .qython.assert[candidate[(1;2;4;20)] = 1b];
    .qython.assert[candidate[(1;20;4;10)] = 0b];
    .qython.assert[candidate[(4;1;0;-10)] = 1b];
    .qython.assert[candidate[(4;1;1;0)] = 1b];
    .qython.assert[candidate[(1;2;3;2;5;60)] = 0b];
    .qython.assert[candidate[(1;2;3;4;5;60)] = 1b];
    .qython.assert[candidate[(9;9;9;9)] = 1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:57 -->
================================================================================

<!-- PROBLEM_START:58 -->
# Problem 58

<!-- META_START -->
**Task ID:** HumanEval/58
**Entry Point:** common
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def common(l1: list, l2: list):
    """Return sorted unique common elements for two lists.
    >>> common([1, 4, 3, 34, 653, 2, 5], [5, 7, 1, 5, 9, 653, 121])
    [1, 5, 653]
    >>> common([5, 3, 2, 8], [3, 2])
    [2, 3]

    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ret = set()
    for e1 in l1:
        for e2 in l2:
            if e1 == e2:
                ret.add(e1)
    return sorted(list(ret))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;4;3;34;653;2;5);(5;7;1;5;9;653;121)] = (1;5;653)];
    .qython.assert[candidate[(5;3;2;8);(3;2)] = (2;3)];
    .qython.assert[candidate[(4;3;2;8);(3;2;4)] = (2;3;4)];
    .qython.assert[candidate[(4;3;2;8);()] = ()]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:58 -->
================================================================================

<!-- PROBLEM_START:59 -->
# Problem 59

<!-- META_START -->
**Task ID:** HumanEval/59
**Entry Point:** largest_prime_factor
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def largest_prime_factor(n: int):
    """Return the largest prime factor of n. Assume n > 1 and is not a prime.
    >>> largest_prime_factor(13195)
    29
    >>> largest_prime_factor(2048)
    2
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def is_prime(k):
        if k < 2:
            return False
        for i in range(2, k - 1):
            if k % i == 0:
                return False
        return True
    largest = 1
    for j in range(2, n + 1):
        if n % j == 0 and is_prime(j):
            largest = max(largest, j)
    return largest
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[15] = 5];
    .qython.assert[candidate[27] = 3];
    .qython.assert[candidate[63] = 7];
    .qython.assert[candidate[330] = 11];
    .qython.assert[candidate[13195] = 29]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:59 -->
================================================================================

<!-- PROBLEM_START:60 -->
# Problem 60

<!-- META_START -->
**Task ID:** HumanEval/60
**Entry Point:** sum_to_n
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sum_to_n(n: int):
    """sum_to_n is a function that sums numbers from 1 to n.
    >>> sum_to_n(30)
    465
    >>> sum_to_n(100)
    5050
    >>> sum_to_n(5)
    15
    >>> sum_to_n(10)
    55
    >>> sum_to_n(1)
    1
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sum(range(n + 1))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[1] = 1];
    .qython.assert[candidate[6] = 21];
    .qython.assert[candidate[11] = 66];
    .qython.assert[candidate[30] = 465];
    .qython.assert[candidate[100] = 5050]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:60 -->
================================================================================

<!-- PROBLEM_START:61 -->
# Problem 61

<!-- META_START -->
**Task ID:** HumanEval/61
**Entry Point:** correct_bracketing
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def correct_bracketing(brackets: str):
    """ brackets is a string of "(" and ")".
    return True if every opening bracket has a corresponding closing bracket.

    >>> correct_bracketing("(")
    False
    >>> correct_bracketing("()")
    True
    >>> correct_bracketing("(()())")
    True
    >>> correct_bracketing(")(()")
    False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
depth = 0
    for b in brackets:
        if b == "(":
            depth += 1
        else:
            depth -= 1
        if depth < 0:
            return False
    return depth == 0
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["()"]];
    .qython.assert[candidate["(()())"]];
    .qython.assert[candidate["()()(()())()"]];
    .qython.assert[candidate["()()((()()())())(()()(()))"]];
    .qython.assert[not candidate["((()())))"]];
    .qython.assert[not candidate[")(()"]];
    .qython.assert[not candidate[enlist["("]]];
    .qython.assert[not candidate["(((("]];
    .qython.assert[not candidate[enlist[")"]]];
    .qython.assert[not candidate["(()"]];
    .qython.assert[not candidate["()()(()())())(()"]];
    .qython.assert[not candidate["()()(()())()))()"]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:61 -->
================================================================================

<!-- PROBLEM_START:62 -->
# Problem 62

<!-- META_START -->
**Task ID:** HumanEval/62
**Entry Point:** derivative
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def derivative(xs: list):
    """ xs represent coefficients of a polynomial.
    xs[0] + xs[1] * x + xs[2] * x^2 + ....
     Return derivative of this polynomial in the same form.
    >>> derivative([3, 1, 2, 4, 5])
    [1, 4, 12, 20]
    >>> derivative([1, 2, 3])
    [2, 6]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [(i * x) for i, x in enumerate(xs)][1:]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(3;1;2;4;5)] = (1;4;12;20)];
    .qython.assert[candidate[(1;2;3)] = (2;6)];
    .qython.assert[candidate[(3;2;1)] = (2;2)];
    .qython.assert[candidate[(3;2;1;0;4)] = (2;2;0;16)];
    .qython.assert[(candidate[enlist 1]) = ()]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:62 -->
================================================================================

<!-- PROBLEM_START:63 -->
# Problem 63

<!-- META_START -->
**Task ID:** HumanEval/63
**Entry Point:** fibfib
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def fibfib(n: int):
    """The FibFib number sequence is a sequence similar to the Fibbonacci sequnece that's defined as follows:
    fibfib(0) == 0
    fibfib(1) == 0
    fibfib(2) == 1
    fibfib(n) == fibfib(n-1) + fibfib(n-2) + fibfib(n-3).
    Please write a function to efficiently compute the n-th element of the fibfib number sequence.
    >>> fibfib(1)
    0
    >>> fibfib(5)
    4
    >>> fibfib(8)
    24
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n == 0:
        return 0
    if n == 1:
        return 0
    if n == 2:
        return 1
    return fibfib(n - 1) + fibfib(n - 2) + fibfib(n - 3)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[2] = 1];
    .qython.assert[candidate[1] = 0];
    .qython.assert[candidate[5] = 4];
    .qython.assert[candidate[8] = 24];
    .qython.assert[candidate[10] = 81];
    .qython.assert[candidate[12] = 274];
    .qython.assert[candidate[14] = 927]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:63 -->
================================================================================

<!-- PROBLEM_START:64 -->
# Problem 64

<!-- META_START -->
**Task ID:** HumanEval/64
**Entry Point:** vowels_count
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
FIX = """
Add more test cases.
"""

def vowels_count(s):
    """Write a function vowels_count which takes a string representing
    a word as input and returns the number of vowels in the string.
    Vowels in this case are 'a', 'e', 'i', 'o', 'u'. Here, 'y' is also a
    vowel, but only when it is at the end of the given word.

    Example:
    >>> vowels_count("abcde")
    2
    >>> vowels_count("ACEDY")
    3
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
vowels = "aeiouAEIOU"
    n_vowels = sum(c in vowels for c in s)
    if s[-1] == 'y' or s[-1] == 'Y':
        n_vowels += 1
    return n_vowels
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["abcde"] = 2;"Test 1"];
    .qython.assert2[candidate["Alone"] = 3;"Test 2"];
    .qython.assert2[candidate["key"] = 2;"Test 3"];
    .qython.assert2[candidate["bye"] = 1;"Test 4"];
    .qython.assert2[candidate["keY"] = 2;"Test 5"];
    .qython.assert2[candidate["bYe"] = 1;"Test 6"];
    .qython.assert2[candidate["ACEDY"] = 3;"Test 7"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:64 -->
================================================================================

<!-- PROBLEM_START:65 -->
# Problem 65

<!-- META_START -->
**Task ID:** HumanEval/65
**Entry Point:** circular_shift
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def circular_shift(x, shift):
    """Circular shift the digits of the integer x, shift the digits right by shift
    and return the result as a string.
    If shift > number of digits, return digits reversed.
    >>> circular_shift(12, 1)
    "21"
    >>> circular_shift(12, 2)
    "12"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
s = str(x)
    if shift > len(s):
        return s[::-1]
    else:
        return s[len(s) - shift:] + s[:len(s) - shift]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[100;2] = "001"];
    .qython.assert[candidate[12;2] = "12"];
    .qython.assert[candidate[97;8] = "79"];
    .qython.assert2[candidate[12;1] = "21";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[11;101] = "11";"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:65 -->
================================================================================

<!-- PROBLEM_START:66 -->
# Problem 66

<!-- META_START -->
**Task ID:** HumanEval/66
**Entry Point:** digitSum
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def digitSum(s):
    """Task
    Write a function that takes a string as input and returns the sum of the upper characters only'
    ASCII codes.

    Examples:
        digitSum("") => 0
        digitSum("abAB") => 131
        digitSum("abcCd") => 67
        digitSum("helloE") => 69
        digitSum("woArBld") => 131
        digitSum("aAaaaXa") => 153
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if s == "": return 0
    return sum(ord(char) if char.isupper() else 0 for char in s)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[""] = 0;"Error"];
    .qython.assert2[candidate["abAB"] = 131;"Error"];
    .qython.assert2[candidate["abcCd"] = 67;"Error"];
    .qython.assert2[candidate["helloE"] = 69;"Error"];
    .qython.assert2[candidate["woArBld"] = 131;"Error"];
    .qython.assert2[candidate["aAaaaXa"] = 153;"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[(candidate[" How are yOu?"]) = 151;"Error"];
    .qython.assert2[(candidate["You arE Very Smart"]) = 327;"Error"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:66 -->
================================================================================

<!-- PROBLEM_START:67 -->
# Problem 67

<!-- META_START -->
**Task ID:** HumanEval/67
**Entry Point:** fruit_distribution
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def fruit_distribution(s,n):
    """
    In this task, you will be given a string that represents a number of apples and oranges 
    that are distributed in a basket of fruit this basket contains 
    apples, oranges, and mango fruits. Given the string that represents the total number of 
    the oranges and apples and an integer that represent the total number of the fruits 
    in the basket return the number of the mango fruits in the basket.
    for examble:
    fruit_distribution("5 apples and 6 oranges", 19) ->19 - 5 - 6 = 8
    fruit_distribution("0 apples and 1 oranges",3) -> 3 - 0 - 1 = 2
    fruit_distribution("2 apples and 3 oranges", 100) -> 100 - 2 - 3 = 95
    fruit_distribution("100 apples and 1 oranges",120) -> 120 - 100 - 1 = 19
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
lis = list()
    for i in s.split(' '):
        if i.isdigit():
            lis.append(int(i))
    return n - sum(lis)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate["5 apples and 6 oranges";19]) = 8];
    .qython.assert[(candidate["5 apples and 6 oranges";21]) = 10];
    .qython.assert[(candidate["0 apples and 1 oranges";3]) = 2];
    .qython.assert[(candidate["1 apples and 0 oranges";3]) = 2];
    .qython.assert[(candidate["2 apples and 3 oranges";100]) = 95];
    .qython.assert[(candidate["2 apples and 3 oranges";5]) = 0];
    .qython.assert[(candidate["1 apples and 100 oranges";120]) = 19]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:67 -->
================================================================================

<!-- PROBLEM_START:68 -->
# Problem 68

<!-- META_START -->
**Task ID:** HumanEval/68
**Entry Point:** pluck
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def pluck(arr):
    """
    "Given an array representing a branch of a tree that has non-negative integer nodes
    your task is to pluck one of the nodes and return it.
    The plucked node should be the node with the smallest even value.
    If multiple nodes with the same smallest even value are found return the node that has smallest index.

    The plucked node should be returned in a list, [ smalest_value, its index ],
    If there are no even values or the given array is empty, return [].

    Example 1:
        Input: [4,2,3]
        Output: [2, 1]
        Explanation: 2 has the smallest even value, and 2 has the smallest index.

    Example 2:
        Input: [1,2,3]
        Output: [2, 1]
        Explanation: 2 has the smallest even value, and 2 has the smallest index. 

    Example 3:
        Input: []
        Output: []
    
    Example 4:
        Input: [5, 0, 3, 0, 4, 2]
        Output: [0, 1]
        Explanation: 0 is the smallest value, but  there are two zeros,
                     so we will choose the first zero, which has the smallest index.

    Constraints:
        * 1 <= nodes.length <= 10000
        * 0 <= node.value
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if(len(arr) == 0): return []
    evens = list(filter(lambda x: x%2 == 0, arr))
    if(evens == []): return []
    return [min(evens), arr.index(min(evens))]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(4;2;3)] = (2;1);"Error"];
    .qython.assert2[candidate[(1;2;3)] = (2;1);"Error"];
    .qython.assert2[candidate[()] = ();"Error"];
    .qython.assert2[candidate[(5;0;3;0;4;2)] = (0;1);"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;0;5;3)] = (0;3);"Error"];
    .qython.assert2[candidate[(5;4;8;4;8)] = (4;1);"Error"];
    .qython.assert2[candidate[(7;6;7;1)] = (6;1);"Error"];
    .qython.assert2[candidate[(7;9;7;1)] = ();"Error"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:68 -->
================================================================================

<!-- PROBLEM_START:69 -->
# Problem 69

<!-- META_START -->
**Task ID:** HumanEval/69
**Entry Point:** search
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def search(lst):
    '''
    You are given a non-empty list of positive integers. Return the greatest integer that is greater than 
    zero, and has a frequency greater than or equal to the value of the integer itself. 
    The frequency of an integer is the number of times it appears in the list.
    If no such a value exist, return -1.
    Examples:
        search([4, 1, 2, 2, 3, 1]) == 2
        search([1, 2, 2, 3, 3, 3, 4, 4, 4]) == 3
        search([5, 5, 4, 4, 4]) == -1
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
frq = [0] * (max(lst) + 1)
    for i in lst:
        frq[i] += 1;

    ans = -1
    for i in range(1, len(frq)):
        if frq[i] >= i:
            ans = i
    
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(5;5;5;5;1)] = 1];
    .qython.assert[candidate[(4;1;4;1;4;4)] = 4];
    .qython.assert[candidate[(3;3)] = -1];
    .qython.assert[candidate[(8;8;8;8;8;8;8;8)] = 8];
    .qython.assert[candidate[(2;3;3;2;2)] = 2];
    .qython.assert[candidate[(2;7;8;8;4;8;7;3;9;6;5;10;4;3;6;7;1;7;4;10;8;1)] = 1];
    .qython.assert[candidate[(3;2;8;2)] = 2];
    .qython.assert[candidate[(6;7;1;8;8;10;5;8;5;3;10)] = 1];
    .qython.assert[candidate[(8;8;3;6;5;6;4)] = -1];
    .qython.assert[candidate[(6;9;6;7;1;4;7;1;8;8;9;8;10;10;8;4;10;4;10;1;2;9;5;7;9)] = 1];
    .qython.assert[candidate[(1;9;10;1;3)] = 1];
    .qython.assert[candidate[(6;9;7;5;8;7;5;3;7;5;10;10;3;6;10;2;8;6;5;4;9;5;3;10)] = 5];
    .qython.assert[(candidate[enlist 1]) = 1];
    .qython.assert[candidate[(8;8;10;6;4;3;5;8;2;4;2;8;4;6;10;4;2;1;10;2;1;1;5)] = 4];
    .qython.assert[candidate[(2;10;4;8;2;10;5;1;2;9;5;5;6;3;8;6;4;10)] = 2];
    .qython.assert[candidate[(1;6;10;1;6;9;10;8;6;8;7;3)] = 1];
    .qython.assert[candidate[(9;2;4;1;5;1;5;2;5;7;7;7;3;10;1;5;4;2;8;4;1;9;10;7;10;2;8;10;9;4)] = 4];
    .qython.assert[candidate[(2;6;4;2;8;7;5;6;4;10;4;6;3;7;8;8;3;1;4;2;2;10;7)] = 4];
    .qython.assert[candidate[(9;8;6;10;2;6;10;2;7;8;10;3;8;2;6;2;3;1)] = 2];
    .qython.assert[candidate[(5;5;3;9;5;6;3;2;8;5;6;10;10;6;8;4;10;7;7;10;8)] = -1];
    .qython.assert[(candidate[enlist 10]) = -1];
    .qython.assert[candidate[(9;7;7;2;4;7;2;10;9;7;5;7;2)] = 2];
    .qython.assert[candidate[(5;4;10;2;1;1;10;3;6;1;8)] = 1];
    .qython.assert[candidate[(7;9;9;9;3;4;1;5;9;1;2;1;1;10;7;5;6;7;6;7;7;6)] = 1];
    .qython.assert[candidate[(3;10;10;9;2)] = -1]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:69 -->
================================================================================

<!-- PROBLEM_START:70 -->
# Problem 70

<!-- META_START -->
**Task ID:** HumanEval/70
**Entry Point:** strange_sort_list
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def strange_sort_list(lst):
    '''
    Given list of integers, return list in strange order.
    Strange sorting, is when you start with the minimum value,
    then maximum of the remaining integers, then minimum and so on.

    Examples:
    strange_sort_list([1, 2, 3, 4]) == [1, 4, 2, 3]
    strange_sort_list([5, 5, 5, 5]) == [5, 5, 5, 5]
    strange_sort_list([]) == []
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
res, switch = [], True
    while lst:
        res.append(min(lst) if switch else max(lst))
        lst.remove(res[-1])
        switch = not switch
    return res
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;3;4)] = (1;4;2;3)];
    .qython.assert[candidate[(5;6;7;8;9)] = (5;9;6;8;7)];
    .qython.assert[candidate[(1;2;3;4;5)] = (1;5;2;4;3)];
    .qython.assert[candidate[(5;6;7;8;9;1)] = (1;9;5;8;6;7)];
    .qython.assert[candidate[(5;5;5;5)] = (5;5;5;5)];
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;2;3;4;5;6;7;8)] = (1;8;2;7;3;6;4;5)];
    .qython.assert[candidate[(0;2;2;2;5;5;-5;-5)] = (-5;5;-5;5;0;2;2;2)];
    .qython.assert[(candidate[enlist 111111]) = enlist 111111];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:70 -->
================================================================================

<!-- PROBLEM_START:71 -->
# Problem 71

<!-- META_START -->
**Task ID:** HumanEval/71
**Entry Point:** triangle_area
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def triangle_area(a, b, c):
    '''
    Given the lengths of the three sides of a triangle. Return the area of
    the triangle rounded to 2 decimal points if the three sides form a valid triangle. 
    Otherwise return -1
    Three sides make a valid triangle when the sum of any two sides is greater 
    than the third side.
    Example:
    triangle_area(3, 4, 5) == 6.00
    triangle_area(1, 2, 10) == -1
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if a + b <= c or a + c <= b or b + c <= a:
        return -1 
    s = (a + b + c)/2    
    area = (s * (s - a) * (s - b) * (s - c)) ** 0.5
    area = round(area, 2)
    return area
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[3;4;5] = 6.00;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[1;2;10] = -1];
    .qython.assert[candidate[4;8;5] = 8.18];
    .qython.assert[candidate[2;2;2] = 1.73];
    .qython.assert[candidate[1;2;3] = -1];
    .qython.assert[candidate[10;5;7] = 16.25];
    .qython.assert[candidate[2;6;3] = -1];
    .qython.assert2[candidate[1;1;1] = 0.43;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[2;2;10] = -1]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:71 -->
================================================================================

<!-- PROBLEM_START:72 -->
# Problem 72

<!-- META_START -->
**Task ID:** HumanEval/72
**Entry Point:** will_it_fly
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def will_it_fly(q,w):
    '''
    Write a function that returns True if the object q will fly, and False otherwise.
    The object q will fly if it's balanced (it is a palindromic list) and the sum of its elements is less than or equal the maximum possible weight w.

    Example:
    will_it_fly([1, 2], 5) ➞ False 
    # 1+2 is less than the maximum possible weight, but it's unbalanced.

    will_it_fly([3, 2, 3], 1) ➞ False
    # it's balanced, but 3+2+3 is more than the maximum possible weight.

    will_it_fly([3, 2, 3], 9) ➞ True
    # 3+2+3 is less than the maximum possible weight, and it's balanced.

    will_it_fly([3], 5) ➞ True
    # 3 is less than the maximum possible weight, and it's balanced.
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if sum(q) > w:
        return False

    i, j = 0, len(q)-1
    while i<j:
        if q[i] != q[j]:
            return False
        i+=1
        j-=1
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(3;2;3);9]~1b];
    .qython.assert[candidate[(1;2);5]~0b];
    .qython.assert[(candidate[enlist 3;5])~1b];
    .qython.assert[candidate[(3;2;3);1]~0b];
    .qython.assert[candidate[(1;2;3);6]~0b];
    .qython.assert[(candidate[enlist 5;5])~1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:72 -->
================================================================================

<!-- PROBLEM_START:73 -->
# Problem 73

<!-- META_START -->
**Task ID:** HumanEval/73
**Entry Point:** smallest_change
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def smallest_change(arr):
    """
    Given an array arr of integers, find the minimum number of elements that
    need to be changed to make the array palindromic. A palindromic array is an array that
    is read the same backwards and forwards. In one change, you can change one element to any other element.

    For example:
    smallest_change([1,2,3,5,4,7,9,6]) == 4
    smallest_change([1, 2, 3, 4, 3, 2, 2]) == 1
    smallest_change([1, 2, 3, 2, 1]) == 0
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ans = 0
    for i in range(len(arr) // 2):
        if arr[i] != arr[len(arr) - i - 1]:
            ans += 1
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;3;5;4;7;9;6)] = 4];
    .qython.assert[candidate[(1;2;3;4;3;2;2)] = 1];
    .qython.assert[candidate[(1;4;2)] = 1];
    .qython.assert[candidate[(1;4;4;2)] = 1];
    .qython.assert[candidate[(1;2;3;2;1)] = 0];
    .qython.assert[candidate[(3;1;1;3)] = 0];
    .qython.assert[(candidate[enlist 1]) = 0];
    .qython.assert[candidate[(0;1)] = 1]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:73 -->
================================================================================

<!-- PROBLEM_START:74 -->
# Problem 74

<!-- META_START -->
**Task ID:** HumanEval/74
**Entry Point:** total_match
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def total_match(lst1, lst2):
    '''
    Write a function that accepts two lists of strings and returns the list with the smaller total character count across all its strings.

    if the two lists have the same number of chars, return the first list.

    Examples
    total_match([], []) ➞ []
    total_match(['hi', 'admin'], ['hI', 'Hi']) ➞ ['hI', 'Hi']
    total_match(['hi', 'admin'], ['hi', 'hi', 'admin', 'project']) ➞ ['hi', 'admin']
    total_match(['hi', 'admin'], ['hI', 'hi', 'hi']) ➞ ['hI', 'hi', 'hi']
    total_match(['4'], ['1', '2', '3', '4', '5']) ➞ ['4']
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
l1 = 0
    for st in lst1:
        l1 += len(st)
    
    l2 = 0
    for st in lst2:
        l2 += len(st)
    
    if l1 <= l2:
        return lst1
    else:
        return lst2
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[();()] = ()];
    .qython.assert[candidate[("hi";"admin");("hi";"hi")] = ("hi";"hi")];
    .qython.assert[candidate[("hi";"admin");("hi";"hi";"admin";"project")] = ("hi";"admin")];
    .qython.assert[(candidate[enlist enlist["4"];(enlist["1"];enlist["2"];enlist["3"];enlist["4"];enlist["5"])]) = enlist enlist["4"]];
    .qython.assert[candidate[("hi";"admin");("hI";"Hi")] = ("hI";"Hi")];
    .qython.assert[candidate[("hi";"admin");("hI";"hi";"hi")] = ("hI";"hi";"hi")];
    .qython.assert[candidate[("hi";"admin");("hI";"hi";"hii")] = ("hi";"admin")];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[(candidate[();enlist "this"]) = ()];
    .qython.assert[(candidate[enlist "this";()]) = ()]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:74 -->
================================================================================

<!-- PROBLEM_START:75 -->
# Problem 75

<!-- META_START -->
**Task ID:** HumanEval/75
**Entry Point:** is_multiply_prime
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_multiply_prime(a):
    """Write a function that returns true if the given number is the multiplication of 3 prime numbers
    and false otherwise.
    Knowing that (a) is less then 100. 
    Example:
    is_multiply_prime(30) == True
    30 = 2 * 3 * 5
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def is_prime(n):
        for j in range(2,n):
            if n%j == 0:
                return False
        return True

    for i in range(2,101):
        if not is_prime(i): continue
        for j in range(2,101):
            if not is_prime(j): continue
            for k in range(2,101):
                if not is_prime(k): continue
                if i*j*k == a: return True
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5] = 0b];
    .qython.assert[candidate[30] = 1b];
    .qython.assert[candidate[8] = 1b];
    .qython.assert[candidate[10] = 0b];
    .qython.assert[candidate[125] = 1b];
    .qython.assert[candidate[(3*5)*7] = 1b];
    .qython.assert[candidate[(3*6)*7] = 0b];
    .qython.assert[candidate[(9*9)*9] = 0b];
    .qython.assert[candidate[(11*9)*9] = 0b];
    .qython.assert[candidate[(11*13)*7] = 1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:75 -->
================================================================================

<!-- PROBLEM_START:76 -->
# Problem 76

<!-- META_START -->
**Task ID:** HumanEval/76
**Entry Point:** is_simple_power
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_simple_power(x, n):
    """Your task is to write a function that returns true if a number x is a simple
    power of n and false in other cases.
    x is a simple power of n if n**int=x
    For example:
    is_simple_power(1, 4) => true
    is_simple_power(2, 2) => true
    is_simple_power(8, 2) => true
    is_simple_power(3, 2) => false
    is_simple_power(3, 1) => false
    is_simple_power(5, 3) => false
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if (n == 1): 
        return (x == 1) 
    power = 1
    while (power < x): 
        power = power * n 
    return (power == x)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[16;2] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[143214;16] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[4;2] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[9;3] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[16;4] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[24;2] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[128;4] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[12;6] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1;1] = 1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[1;12] = 1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:76 -->
================================================================================

<!-- PROBLEM_START:77 -->
# Problem 77

<!-- META_START -->
**Task ID:** HumanEval/77
**Entry Point:** iscube
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def iscube(a):
    '''
    Write a function that takes an integer a and returns True 
    if this integer is a cube of some integer number.
    Note: you may assume the input is always valid.
    Examples:
    iscube(1) ==> True
    iscube(2) ==> False
    iscube(-1) ==> True
    iscube(64) ==> True
    iscube(0) ==> True
    iscube(180) ==> False
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
a = abs(a)
    return int(round(a ** (1. / 3))) ** 3 == a
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[1] = 1b;raze[(.qython.String["First test error: "];.qython.String[candidate[1]])]];
    .qython.assert2[candidate[2] = 0b;raze[(.qython.String["Second test error: "];.qython.String[candidate[2]])]];
    .qython.assert2[candidate[-1] = 1b;raze[(.qython.String["Third test error: "];.qython.String[candidate[-1]])]];
    .qython.assert2[candidate[64] = 1b;raze[(.qython.String["Fourth test error: "];.qython.String[candidate[64]])]];
    .qython.assert2[candidate[180] = 0b;raze[(.qython.String["Fifth test error: "];.qython.String[candidate[180]])]];
    .qython.assert2[candidate[1000] = 1b;raze[(.qython.String["Sixth test error: "];.qython.String[candidate[1000]])]];
    .qython.assert2[candidate[0] = 1b;raze[(.qython.String["1st edge test error: "];.qython.String[candidate[0]])]];
    .qython.assert2[candidate[1729] = 0b;raze[(.qython.String["2nd edge test error: "];.qython.String[candidate[1728]])]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:77 -->
================================================================================

<!-- PROBLEM_START:78 -->
# Problem 78

<!-- META_START -->
**Task ID:** HumanEval/78
**Entry Point:** hex_key
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def hex_key(num):
    """You have been tasked to write a function that receives 
    a hexadecimal number as a string and counts the number of hexadecimal 
    digits that are primes (prime number, or a prime, is a natural number 
    greater than 1 that is not a product of two smaller natural numbers).
    Hexadecimal digits are 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F.
    Prime numbers are 2, 3, 5, 7, 11, 13, 17,...
    So you have to determine a number of the following digits: 2, 3, 5, 7, 
    B (=decimal 11), D (=decimal 13).
    Note: you may assume the input is always correct or empty string, 
    and symbols A,B,C,D,E,F are always uppercase.
    Examples:
    For num = "AB" the output should be 1.
    For num = "1077E" the output should be 2.
    For num = "ABED1A33" the output should be 4.
    For num = "123456789ABCDEF0" the output should be 6.
    For num = "2020" the output should be 2.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
primes = ('2', '3', '5', '7', 'B', 'D')
    total = 0
    for i in range(0, len(num)):
        if num[i] in primes:
            total += 1
    return total
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["AB"] = 1;raze[(.qython.String["First test error: "];.qython.String[candidate["AB"]])]];
    .qython.assert2[candidate["1077E"] = 2;raze[(.qython.String["Second test error: "];.qython.String[candidate["1077E"]])]];
    .qython.assert2[candidate["ABED1A33"] = 4;raze[(.qython.String["Third test error: "];.qython.String[candidate["ABED1A33"]])]];
    .qython.assert2[candidate["2020"] = 2;raze[(.qython.String["Fourth test error: "];.qython.String[candidate["2020"]])]];
    .qython.assert2[candidate["123456789ABCDEF0"] = 6;raze[(.qython.String["Fifth test error: "];.qython.String[candidate["123456789ABCDEF0"]])]];
    .qython.assert2[candidate["112233445566778899AABBCCDDEEFF00"] = 12;raze[(.qython.String["Sixth test error: "];.qython.String[candidate["112233445566778899AABBCCDDEEFF00"]])]];
    .qython.assert[candidate[()] = 0]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:78 -->
================================================================================

<!-- PROBLEM_START:79 -->
# Problem 79

<!-- META_START -->
**Task ID:** HumanEval/79
**Entry Point:** decimal_to_binary
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def decimal_to_binary(decimal):
    """You will be given a number in decimal form and your task is to convert it to
    binary format. The function should return a string, with each character representing a binary
    number. Each character in the string will be '0' or '1'.

    There will be an extra couple of characters 'db' at the beginning and at the end of the string.
    The extra characters are there to help with the format.

    Examples:
    decimal_to_binary(15)   # returns "db1111db"
    decimal_to_binary(32)   # returns "db100000db"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return "db" + bin(decimal)[2:] + "db"
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[0] = "db0db"];
    .qython.assert[candidate[32] = "db100000db"];
    .qython.assert[candidate[103] = "db1100111db"];
    .qython.assert2[candidate[15] = "db1111db";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:79 -->
================================================================================

<!-- PROBLEM_START:80 -->
# Problem 80

<!-- META_START -->
**Task ID:** HumanEval/80
**Entry Point:** is_happy
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_happy(s):
    """You are given a string s.
    Your task is to check if the string is happy or not.
    A string is happy if its length is at least 3 and every 3 consecutive letters are distinct
    For example:
    is_happy('a') => False
    is_happy('aa') => False
    is_happy('abcd') => True
    is_happy('aabb') => False
    is_happy('adb') => True
    is_happy('xyy') => False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if len(s) < 3:
      return False

    for i in range(len(s) - 2):
      
      if s[i] == s[i+1] or s[i+1] == s[i+2] or s[i] == s[i+2]:
        return False
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[enlist["a"]] = 0b;enlist["a"]];
    .qython.assert2[candidate["aa"] = 0b;"aa"];
    .qython.assert2[candidate["abcd"] = 1b;"abcd"];
    .qython.assert2[candidate["aabb"] = 0b;"aabb"];
    .qython.assert2[candidate["adb"] = 1b;"adb"];
    .qython.assert2[candidate["xyy"] = 0b;"xyy"];
    .qython.assert2[candidate["iopaxpoi"] = 1b;"iopaxpoi"];
    .qython.assert2[candidate["iopaxioi"] = 0b;"iopaxioi"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:80 -->
================================================================================

<!-- PROBLEM_START:81 -->
# Problem 81

<!-- META_START -->
**Task ID:** HumanEval/81
**Entry Point:** numerical_letter_grade
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def numerical_letter_grade(grades):
    """It is the last week of the semester and the teacher has to give the grades
    to students. The teacher has been making her own algorithm for grading.
    The only problem is, she has lost the code she used for grading.
    She has given you a list of GPAs for some students and you have to write 
    a function that can output a list of letter grades using the following table:
             GPA       |    Letter grade
              4.0                A+
            > 3.7                A 
            > 3.3                A- 
            > 3.0                B+
            > 2.7                B 
            > 2.3                B-
            > 2.0                C+
            > 1.7                C
            > 1.3                C-
            > 1.0                D+ 
            > 0.7                D 
            > 0.0                D-
              0.0                E
    

    Example:
    grade_equation([4.0, 3, 1.7, 2, 3.5]) ==> ['A+', 'B', 'C-', 'C', 'A-']
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
letter_grade = []
    for gpa in grades:
        if gpa == 4.0:
            letter_grade.append("A+")
        elif gpa > 3.7:
            letter_grade.append("A")
        elif gpa > 3.3:
            letter_grade.append("A-")
        elif gpa > 3.0:
            letter_grade.append("B+")
        elif gpa > 2.7:
            letter_grade.append("B")
        elif gpa > 2.3:
            letter_grade.append("B-")
        elif gpa > 2.0:
            letter_grade.append("C+")
        elif gpa > 1.7:
            letter_grade.append("C")
        elif gpa > 1.3:
            letter_grade.append("C-")
        elif gpa > 1.0:
            letter_grade.append("D+")
        elif gpa > 0.7:
            letter_grade.append("D")
        elif gpa > 0.0:
            letter_grade.append("D-")
        else:
            letter_grade.append("E")
    return letter_grade
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(4.0;3;1.7;2;3.5)] = ("A+";enlist["B"];"C-";enlist["C"];"A-")];
    .qython.assert[(candidate[enlist 1.2]) = enlist "D+"];
    .qython.assert[(candidate[enlist 0.5]) = enlist "D-"];
    .qython.assert[(candidate[enlist 0.0]) = enlist enlist["E"]];
    .qython.assert[candidate[(1;0.3;1.5;2.8;3.3)] = (enlist["D"];"D-";"C-";enlist["B"];"B+")];
    .qython.assert[candidate[(0;0.7)] = (enlist["E"];"D-")];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:81 -->
================================================================================

<!-- PROBLEM_START:82 -->
# Problem 82

<!-- META_START -->
**Task ID:** HumanEval/82
**Entry Point:** prime_length
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def prime_length(string):
    """Write a function that takes a string and returns True if the string
    length is a prime number or False otherwise
    Examples
    prime_length('Hello') == True
    prime_length('abcdcba') == True
    prime_length('kittens') == True
    prime_length('orange') == False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
l = len(string)
    if l == 0 or l == 1:
        return False
    for i in range(2, l):
        if l % i == 0:
            return False
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["Hello"] = 1b];
    .qython.assert[candidate["abcdcba"] = 1b];
    .qython.assert[candidate["kittens"] = 1b];
    .qython.assert[candidate["orange"] = 0b];
    .qython.assert[candidate["wow"] = 1b];
    .qython.assert[candidate["world"] = 1b];
    .qython.assert[candidate["MadaM"] = 1b];
    .qython.assert[candidate["Wow"] = 1b];
    .qython.assert[candidate[""] = 0b];
    .qython.assert[candidate["HI"] = 1b];
    .qython.assert[candidate["go"] = 1b];
    .qython.assert[candidate["gogo"] = 0b];
    .qython.assert[candidate["aaaaaaaaaaaaaaa"] = 0b];
    .qython.assert[candidate["Madam"] = 1b];
    .qython.assert[candidate[enlist["M"]] = 0b];
    .qython.assert[candidate[enlist["0"]] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:82 -->
================================================================================

<!-- PROBLEM_START:83 -->
# Problem 83

<!-- META_START -->
**Task ID:** HumanEval/83
**Entry Point:** starts_one_ends
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def starts_one_ends(n):
    """
    Given a positive integer n, return the count of the numbers of n-digit
    positive integers that start or end with 1.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n == 1: return 1
    return 18 * (10 ** (n - 2))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[1] = 1];
    .qython.assert[candidate[2] = 18];
    .qython.assert[candidate[3] = 180];
    .qython.assert[candidate[4] = 1800];
    .qython.assert[candidate[5] = 18000];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:83 -->
================================================================================

<!-- PROBLEM_START:84 -->
# Problem 84

<!-- META_START -->
**Task ID:** HumanEval/84
**Entry Point:** solve
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def solve(N):
    """Given a positive integer N, return the total sum of its digits in binary.
    
    Example
        For N = 1000, the sum of digits will be 1 the output should be "1".
        For N = 150, the sum of digits will be 6 the output should be "110".
        For N = 147, the sum of digits will be 12 the output should be "1100".
    
    Variables:
        @N integer
             Constraints: 0 ≤ N ≤ 10000.
    Output:
         a string of binary number
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return bin(sum(int(i) for i in str(N)))[2:]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1000] = enlist["1"];"Error"];
    .qython.assert2[candidate[150] = "110";"Error"];
    .qython.assert2[candidate[147] = "1100";"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[333] = "1001";"Error"];
    .qython.assert2[candidate[963] = "10010";"Error"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:84 -->
================================================================================

<!-- PROBLEM_START:85 -->
# Problem 85

<!-- META_START -->
**Task ID:** HumanEval/85
**Entry Point:** add
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def add(lst):
    """Given a non-empty list of integers lst. add the even elements that are at odd indices..


    Examples:
        add([4, 2, 6, 7]) ==> 2 
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sum([lst[i] for i in range(1, len(lst), 2) if lst[i]%2 == 0])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(4;88)] = 88];
    .qython.assert[candidate[(4;5;6;7;2;122)] = 122];
    .qython.assert[candidate[(4;0;6;7)] = 0];
    .qython.assert[candidate[(4;4;6;8)] = 12]
    }    / Check some edge cases that are easy to work out by hand.
```
<!-- TEST_END -->

<!-- PROBLEM_END:85 -->
================================================================================

<!-- PROBLEM_START:86 -->
# Problem 86

<!-- META_START -->
**Task ID:** HumanEval/86
**Entry Point:** anti_shuffle
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def anti_shuffle(s):
    """
    Write a function that takes a string and returns an ordered version of it.
    Ordered version of string, is a string where all words (separated by space)
    are replaced by a new word where all the characters arranged in
    ascending order based on ascii value.
    Note: You should keep the order of words and blank spaces in the sentence.

    For example:
    anti_shuffle('Hi') returns 'Hi'
    anti_shuffle('hello') returns 'ehllo'
    anti_shuffle('Hello World!!!') returns 'Hello !!!Wdlor'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return ' '.join([''.join(sorted(list(i))) for i in s.split(' ')])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["Hi"] = "Hi"];
    .qython.assert[candidate["hello"] = "ehllo"];
    .qython.assert[candidate["number"] = "bemnru"];
    .qython.assert[candidate["abcd"] = "abcd"];
    .qython.assert[(candidate["Hello World!!!"]) = ("Hello !!!Wdlor")];
    .qython.assert[candidate[""] = ""];
    .qython.assert[(candidate["Hi. My name is Mister Robot. How are you?"]) = (".Hi My aemn is Meirst .Rboot How aer ?ouy")];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:86 -->
================================================================================

<!-- PROBLEM_START:87 -->
# Problem 87

<!-- META_START -->
**Task ID:** HumanEval/87
**Entry Point:** get_row
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def get_row(lst, x):
    """
    You are given a 2 dimensional data, as a nested lists,
    which is similar to matrix, however, unlike matrices,
    each row may contain a different number of columns.
    Given lst, and integer x, find integers x in the list,
    and return list of tuples, [[x1, y1], [x2, y2] ...] such that
    each tuple is a coordinate - [row, columns], starting with 0.
    Sort coordinates initially by rows in ascending order.
    Also, sort coordinates of the row by columns in descending order.
    
    Examples:
    get_row([
      [1,2,3,4,5,6],
      [1,2,3,4,1,6],
      [1,2,3,4,5,1]
    ], 1) == [[0, 0], [1, 4], [1, 0], [2, 5], [2, 0]]
    get_row([], 1) == []
    get_row([[], [1], [1, 2, 3]], 3) == [[2, 2]]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
coords = [(i, j) for i in range(len(lst)) for j in range(len(lst[i])) if lst[i][j] == x]
    return sorted(sorted(coords, key=lambda x: x[1], reverse=True), key=lambda x: x[0])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[((1;2;3;4;5;6);(1;2;3;4;1;6);(1;2;3;4;5;1));1] = ((0;0);(1;4);(1;0);(2;5);(2;0))];
    .qython.assert[candidate[((1;2;3;4;5;6);(1;2;3;4;5;6);(1;2;3;4;5;6);(1;2;3;4;5;6);(1;2;3;4;5;6);(1;2;3;4;5;6));2] = ((0;1);(1;1);(2;1);(3;1);(4;1);(5;1))];
    .qython.assert[candidate[((1;2;3;4;5;6);(1;2;3;4;5;6);(1;1;3;4;5;6);(1;2;1;4;5;6);(1;2;3;1;5;6);(1;2;3;4;1;6);(1;2;3;4;5;1));1] = ((0;0);(1;0);(2;1);(2;0);(3;2);(3;0);(4;3);(4;0);(5;4);(5;0);(6;5);(6;0))];
    .qython.assert[candidate[();1] = ()];
    .qython.assert[(candidate[enlist enlist 1;2]) = ()];
    .qython.assert[(candidate[(();enlist 1;(1;2;3));3]) = enlist (2;2)];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:87 -->
================================================================================

<!-- PROBLEM_START:88 -->
# Problem 88

<!-- META_START -->
**Task ID:** HumanEval/88
**Entry Point:** sort_array
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sort_array(array):
    """
    Given an array of non-negative integers, return a copy of the given array after sorting,
    you will sort the given array in ascending order if the sum( first index value, last index value) is odd,
    or sort it in descending order if the sum( first index value, last index value) is even.

    Note:
    * don't change the given array.

    Examples:
    * sort_array([]) => []
    * sort_array([5]) => [5]
    * sort_array([2, 4, 3, 0, 1, 5]) => [0, 1, 2, 3, 4, 5]
    * sort_array([2, 4, 3, 0, 1, 5, 6]) => [6, 5, 4, 3, 2, 1, 0]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [] if len(array) == 0 else sorted(array, reverse= (array[0]+array[-1]) % 2 == 0)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[()] = ();"Error"];
    .qython.assert2[(candidate[enlist 5]) = enlist 5;"Error"];
    .qython.assert2[candidate[(2;4;3;0;1;5)] = (0;1;2;3;4;5);"Error"];
    .qython.assert2[candidate[(2;4;3;0;1;5;6)] = (6;5;4;3;2;1;0);"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[(2;1)] = (1;2);"Error"];
    .qython.assert2[candidate[(15;42;87;32;11;0)] = (0;11;15;32;42;87);"Error"];
    .qython.assert2[candidate[(21;14;23;11)] = (23;21;14;11);"Error"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:88 -->
================================================================================

<!-- PROBLEM_START:89 -->
# Problem 89

<!-- META_START -->
**Task ID:** HumanEval/89
**Entry Point:** encrypt
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def encrypt(s):
    """Create a function encrypt that takes a string as an argument and returns an encrypted string using a Caesar cipher with a shift of 4 positions. Rules:
    Each letter is replaced by the letter 4 positions ahead in the alphabet
    The alphabet wraps around (e.g., 'w' → 'a', 'x' → 'b', 'y' → 'c', 'z' → 'd')
    Input will only contain lowercase letters
    
    For example:
    encrypt('hi') returns 'lm'
    encrypt('asdfghjkl') returns 'ewhjklnop'
    encrypt('gf') returns 'kj'
    encrypt('et') returns 'ix'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
d = 'abcdefghijklmnopqrstuvwxyz'
    out = ''
    for c in s:
        if c in d:
            out += d[(d.index(c)+2*2) % 26]
        else:
            out += c
    return out
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["hi"] = "lm";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["asdfghjkl"] = "ewhjklnop";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["gf"] = "kj";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["et"] = "ix";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["faewfawefaewg"] = "jeiajeaijeiak";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["hellomyfriend"] = "lippsqcjvmirh";"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate["dxzdlmnilfuhmilufhlihufnmlimnufhlimnufhfucufh"] = "hbdhpqrmpjylqmpyjlpmlyjrqpmqryjlpmqryjljygyjl";"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[enlist["a"]] = enlist["e"];"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:89 -->
================================================================================

<!-- PROBLEM_START:90 -->
# Problem 90

<!-- META_START -->
**Task ID:** HumanEval/90
**Entry Point:** next_smallest
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def next_smallest(lst):
    """
    You are given a list of integers.
    Write a function next_smallest() that returns the 2nd smallest element of the list.
    Return None if there is no such element.
    
    next_smallest([1, 2, 3, 4, 5]) == 2
    next_smallest([5, 1, 4, 3, 2]) == 2
    next_smallest([]) == None
    next_smallest([1, 1]) == None
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
lst = sorted(set(lst))
    return None if len(lst) < 2 else lst[1]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;3;4;5)] = 2];
    .qython.assert[candidate[(5;1;4;3;2)] = 2];
    .qython.assert[candidate[()]~(::)];
    .qython.assert[candidate[(1;1)]~(::)];
    .qython.assert[candidate[(1;1;1;1;0)] = 1];
    .qython.assert[(candidate[(1;(.qython.int[0 xexp 0]))])~(::)];
    .qython.assert[candidate[(-35;34;12;-45)] = -35];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:90 -->
================================================================================

<!-- PROBLEM_START:91 -->
# Problem 91

<!-- META_START -->
**Task ID:** HumanEval/91
**Entry Point:** is_bored
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_bored(S):
    """
    You'll be given a string of words, and your task is to count the number
    of boredoms. A boredom is a sentence that starts with the word "I".
    Sentences are delimited by '.', '?' or '!'.
   
    For example:
    >>> is_bored("Hello world")
    0
    >>> is_bored("The sky is blue. The sun is shining. I love this weather")
    1
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import re
    sentences = re.split(r'[.?!]\s*', S)
    return sum(sentence[0:2] == 'I ' for sentence in sentences)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[(candidate["Hello world"]) = 0;"Test 1"];
    .qython.assert2[(candidate["Is the sky blue?"]) = 0;"Test 2"];
    .qython.assert2[(candidate["I love It !"]) = 1;"Test 3"];
    .qython.assert2[candidate["bIt"] = 0;"Test 4"];
    .qython.assert2[(candidate["I feel good today. I will be productive. will kill It"]) = 2;"Test 5"];
    .qython.assert2[(candidate["You and I are going for a walk"]) = 0;"Test 6"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:91 -->
================================================================================

<!-- PROBLEM_START:92 -->
# Problem 92

<!-- META_START -->
**Task ID:** HumanEval/92
**Entry Point:** any_int
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def any_int(x, y, z):
    '''
    Create a function that takes 3 numbers.
    Returns true if one of the numbers is equal to the sum of the other two, and all numbers are integers.
    Returns false in any other cases.
    
    Examples
    any_int(5, 2, 7) ➞ True
    
    any_int(3, 2, 2) ➞ False

    any_int(3, -2, 1) ➞ True
    
    any_int(3.6, -2.2, 2) ➞ False
  

    
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if isinstance(x,int) and isinstance(y,int) and isinstance(z,int):
        if (x+y==z) or (x+z==y) or (y+z==x):
            return True
        return False
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[2;3;1] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[2.5;2;3] = 0b;"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate[1.5;5;3.5] = 0b;"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[2;6;2] = 0b;"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[candidate[4;2;2] = 1b;"This prints if this assert fails 5 (good for debugging!)"];
    .qython.assert2[candidate[2.2;2.2;2.2] = 0b;"This prints if this assert fails 6 (good for debugging!)"];
    .qython.assert2[candidate[-4;6;2] = 1b;"This prints if this assert fails 7 (good for debugging!)"];
    .qython.assert2[candidate[2;1;1] = 1b;"This prints if this assert fails 8 (also good for debugging!)"];
    .qython.assert2[candidate[3;4;7] = 1b;"This prints if this assert fails 9 (also good for debugging!)"];
    .qython.assert2[candidate[3.0;4;7] = 0b;"This prints if this assert fails 10 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:92 -->
================================================================================

<!-- PROBLEM_START:93 -->
# Problem 93

<!-- META_START -->
**Task ID:** HumanEval/93
**Entry Point:** encode
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def encode(message):
    """
    Write a function that takes a message, and encodes in such a 
    way that it swaps case of all letters, replaces all vowels in 
    the message with the letter that appears 2 places ahead of that 
    vowel in the english alphabet. 
    Assume only letters and spaces. Spaces should be left unchanged.
    
    Examples:
    >>> encode('test')
    'TGST'
    >>> encode('This is a message')
    'tHKS KS C MGSSCGG'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
vowels = "aeiouAEIOU"
    vowels_replace = dict([(i, chr(ord(i) + 2)) for i in vowels])
    message = message.swapcase()
    return ''.join([vowels_replace[i] if i in vowels else i for i in message])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["TEST"] = "tgst";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate["Mudasir"] = "mWDCSKR";"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate["YES"] = "ygs";"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[(candidate["This is a message"]) = ("tHKS KS C MGSSCGG");"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[(candidate["I DoNt KnOw WhAt tO WrItE"]) = ("k dQnT kNqW wHcT Tq wRkTg");"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:93 -->
================================================================================

<!-- PROBLEM_START:94 -->
# Problem 94

<!-- META_START -->
**Task ID:** HumanEval/94
**Entry Point:** skjkasdkd
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def skjkasdkd(lst):
    """You are given a list of integers.
    You need to find the largest prime value and return the sum of its digits.

    Examples:
    For lst = [0,3,2,1,3,5,7,4,5,5,5,2,181,32,4,32,3,2,32,324,4,3] the output should be 10
    For lst = [1,0,1,8,2,4597,2,1,3,40,1,2,1,2,4,2,5,1] the output should be 25
    For lst = [1,3,1,32,5107,34,83278,109,163,23,2323,32,30,1,9,3] the output should be 13
    For lst = [0,724,32,71,99,32,6,0,5,91,83,0,5,6] the output should be 11
    For lst = [0,81,12,3,1,21] the output should be 3
    For lst = [0,8,1,2,1,7] the output should be 7
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def isPrime(n):
        for i in range(2,int(n**0.5)+1):
            if n%i==0:
                return False

        return True
    maxx = 0
    i = 0
    while i < len(lst):
        if(lst[i] > maxx and isPrime(lst[i])):
            maxx = lst[i]
        i+=1
    result = sum(int(digit) for digit in str(maxx))
    return result
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[(0;3;2;1;3;5;7;4;5;5;5;2;181;32;4;32;3;2;32;324;4;3)] = 10;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(1;0;1;8;2;4597;2;1;3;40;1;2;1;2;4;2;5;1)] = 25;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[(1;3;1;32;5107;34;83278;109;163;23;2323;32;30;1;9;3)] = 13;"This prints if this assert fails 3 (also good for debugging!)"];
    .qython.assert2[candidate[(0;724;32;71;99;32;6;0;5;91;83;0;5;6)] = 11;"This prints if this assert fails 4 (also good for debugging!)"];
    .qython.assert2[candidate[(0;81;12;3;1;21)] = 3;"This prints if this assert fails 5 (also good for debugging!)"];
    .qython.assert2[candidate[(0;8;1;2;1;7)] = 7;"This prints if this assert fails 6 (also good for debugging!)"];
    .qython.assert2[(candidate[enlist 8191]) = 19;"This prints if this assert fails 7 (also good for debugging!)"];
    .qython.assert2[candidate[(8191;123456;127;7)] = 19;"This prints if this assert fails 8 (also good for debugging!)"];
    .qython.assert2[candidate[(127;97;8192)] = 10;"This prints if this assert fails 9 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:94 -->
================================================================================

<!-- PROBLEM_START:95 -->
# Problem 95

<!-- META_START -->
**Task ID:** HumanEval/95
**Entry Point:** check_dict_case
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def check_dict_case(dict):
    """
    Given a dictionary, return True if all keys are strings in lower 
    case or all keys are strings in upper case, else return False.
    The function should return False is the given dictionary is empty.
    Examples:
    check_dict_case({"a":"apple", "b":"banana"}) should return True.
    check_dict_case({"a":"apple", "A":"banana", "B":"banana"}) should return False.
    check_dict_case({"a":"apple", 8:"banana", "a":"apple"}) should return False.
    check_dict_case({"Name":"John", "Age":"36", "City":"Houston"}) should return False.
    check_dict_case({"STATE":"NC", "ZIP":"12345" }) should return True.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if len(dict.keys()) == 0:
        return False
    else:
        state = "start"
        for key in dict.keys():

            if isinstance(key, str) == False:
                state = "mixed"
                break
            if state == "start":
                if key.isupper():
                    state = "upper"
                elif key.islower():
                    state = "lower"
                else:
                    break
            elif (state == "upper" and not key.isupper()) or (state == "lower" and not key.islower()):
                    state = "mixed"
                    break
            else:
                break
        return state == "upper" or state == "lower"
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[(enlist["p"];enlist["b"])!("pineapple";"banana")] = 1b;raze[(.qython.String["First test error: "];.qython.String[candidate[(enlist["p"];enlist["b"])!("pineapple";"banana")]])]];
    .qython.assert2[candidate[(enlist["p"];enlist["A"];enlist["B"])!("pineapple";"banana";"banana")] = 0b;raze[(.qython.String["Second test error: "];.qython.String[candidate[(enlist["p"];enlist["A"];enlist["B"])!("pineapple";"banana";"banana")]])]];
    .qython.assert2[candidate[(enlist["p"];5;enlist["a"])!("pineapple";"banana";"apple")] = 0b;raze[(.qython.String["Third test error: "];.qython.String[candidate[(enlist["p"];5;enlist["a"])!("pineapple";"banana";"apple")]])]];
    .qython.assert2[candidate[("Name";"Age";"City")!("John";"36";"Houston")] = 0b;raze[(.qython.String["Fourth test error: "];.qython.String[candidate[("Name";"Age";"City")!("John";"36";"Houston")]])]];
    .qython.assert2[candidate[("STATE";"ZIP")!("NC";"12345")] = 1b;raze[(.qython.String["Fifth test error: "];.qython.String[candidate[("STATE";"ZIP")!("NC";"12345")]])]];
    .qython.assert2[candidate[("fruit";"taste")!("Orange";"Sweet")] = 1b;raze[(.qython.String["Fourth test error: "];.qython.String[candidate[("fruit";"taste")!("Orange";"Sweet")]])]];
    .qython.assert2[candidate[()!()] = 0b;raze[(.qython.String["1st edge test error: "];.qython.String[candidate[()!()]])]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:95 -->
================================================================================

<!-- PROBLEM_START:96 -->
# Problem 96

<!-- META_START -->
**Task ID:** HumanEval/96
**Entry Point:** count_up_to
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def count_up_to(n):
    """Implement a function that takes an non-negative integer and returns an array of the first n
    integers that are prime numbers and less than n.
    for example:
    count_up_to(5) => [2,3]
    count_up_to(11) => [2,3,5,7]
    count_up_to(0) => []
    count_up_to(20) => [2,3,5,7,11,13,17,19]
    count_up_to(1) => []
    count_up_to(18) => [2,3,5,7,11,13,17]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
primes = []
    for i in range(2, n):
        is_prime = True
        for j in range(2, i):
            if i % j == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(i)
    return primes
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5] = (2;3)];
    .qython.assert[candidate[6] = (2;3;5)];
    .qython.assert[candidate[7] = (2;3;5)];
    .qython.assert[candidate[10] = (2;3;5;7)];
    .qython.assert[candidate[0] = ()];
    .qython.assert[candidate[22] = (2;3;5;7;11;13;17;19)];
    .qython.assert[candidate[1] = ()];
    .qython.assert[candidate[18] = (2;3;5;7;11;13;17)];
    .qython.assert[candidate[47] = (2;3;5;7;11;13;17;19;23;29;31;37;41;43)];
    .qython.assert[candidate[101] = (2;3;5;7;11;13;17;19;23;29;31;37;41;43;47;53;59;61;67;71;73;79;83;89;97)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:96 -->
================================================================================

<!-- PROBLEM_START:97 -->
# Problem 97

<!-- META_START -->
**Task ID:** HumanEval/97
**Entry Point:** multiply
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def multiply(a, b):
    """Complete the function that takes two integers and returns 
    the product of their unit digits.
    Assume the input is always valid.
    Examples:
    multiply(148, 412) should return 16.
    multiply(19, 28) should return 72.
    multiply(2020, 1851) should return 0.
    multiply(14,-15) should return 20.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return abs(a % 10) * abs(b % 10)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[148;412] = 16;raze[(.qython.String["First test error: "];.qython.String[candidate[148;412]])]];
    .qython.assert2[candidate[19;28] = 72;raze[(.qython.String["Second test error: "];.qython.String[candidate[19;28]])]];
    .qython.assert2[candidate[2020;1851] = 0;raze[(.qython.String["Third test error: "];.qython.String[candidate[2020;1851]])]];
    .qython.assert2[candidate[14;-15] = 20;raze[(.qython.String["Fourth test error: "];.qython.String[candidate[14;-15]])]];
    .qython.assert2[candidate[76;67] = 42;raze[(.qython.String["Fifth test error: "];.qython.String[candidate[76;67]])]];
    .qython.assert2[candidate[17;27] = 49;raze[(.qython.String["Sixth test error: "];.qython.String[candidate[17;27]])]];
    .qython.assert2[candidate[0;1] = 0;raze[(.qython.String["1st edge test error: "];.qython.String[candidate[0;1]])]];
    .qython.assert2[candidate[0;0] = 0;raze[(.qython.String["2nd edge test error: "];.qython.String[candidate[0;0]])]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:97 -->
================================================================================

<!-- PROBLEM_START:98 -->
# Problem 98

<!-- META_START -->
**Task ID:** HumanEval/98
**Entry Point:** count_upper
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def count_upper(s):
    """
    Given a string s, count the number of uppercase vowels in even indices.
    
    For example:
    count_upper('aBCdEf') returns 1
    count_upper('abcdefg') returns 0
    count_upper('dBBE') returns 0
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
count = 0
    for i in range(0,len(s),2):
        if s[i] in "AEIOU":
            count += 1
    return count
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["aBCdEf"] = 1];
    .qython.assert[candidate["abcdefg"] = 0];
    .qython.assert[candidate["dBBE"] = 0];
    .qython.assert[candidate[enlist["B"]] = 0];
    .qython.assert[candidate[enlist["U"]] = 1];
    .qython.assert[candidate[""] = 0];
    .qython.assert[candidate["EEEE"] = 2];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:98 -->
================================================================================

<!-- PROBLEM_START:99 -->
# Problem 99

<!-- META_START -->
**Task ID:** HumanEval/99
**Entry Point:** closest_integer
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def closest_integer(value):
    '''
    Create a function that takes a value (string) representing a number
    and returns the closest integer to it. If the number is equidistant
    from two integers, round it away from zero.

    Examples
    >>> closest_integer("10")
    10
    >>> closest_integer("15.3")
    15

    Note:
    Rounding away from zero means that if the given number is equidistant
    from two integers, the one you should return is the one that is the
    farthest from zero. For example closest_integer("14.5") should
    return 15 and closest_integer("-14.5") should return -15.
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
from math import floor, ceil

    if value.count('.') == 1:
        # remove trailing zeros
        while (value[-1] == '0'):
            value = value[:-1]

    num = float(value)
    if value[-2:] == '.5':
        if num > 0:
            res = ceil(num)
        else:
            res = floor(num)
    elif len(value) > 0:
        res = int(round(num))
    else:
        res = 0

    return res
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["10"] = 10;"Test 1"];
    .qython.assert2[candidate["14.5"] = 15;"Test 2"];
    .qython.assert2[candidate["-15.5"] = -16;"Test 3"];
    .qython.assert2[candidate["15.3"] = 15;"Test 3"];
    .qython.assert2[candidate[enlist["0"]] = 0;"Test 0"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:99 -->
================================================================================

<!-- PROBLEM_START:100 -->
# Problem 100

<!-- META_START -->
**Task ID:** HumanEval/100
**Entry Point:** make_a_pile
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def make_a_pile(n):
    """
    Given a positive integer n, you have to make a pile of n levels of stones.
    The first level has n stones.
    The number of stones in the next level is:
        - the next odd number if n is odd.
        - the next even number if n is even.
    Return the number of stones in each level in a list, where element at index
    i represents the number of stones in the level (i+1).

    Examples:
    >>> make_a_pile(3)
    [3, 5, 7]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [n + 2*i for i in range(n)]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[3] = (3;5;7);"Test 3"];
    .qython.assert2[candidate[4] = (4;6;8;10);"Test 4"];
    .qython.assert[candidate[5] = (5;7;9;11;13)];
    .qython.assert[candidate[6] = (6;8;10;12;14;16)];
    .qython.assert[candidate[8] = (8;10;12;14;16;18;20;22)];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:100 -->
================================================================================

<!-- PROBLEM_START:101 -->
# Problem 101

<!-- META_START -->
**Task ID:** HumanEval/101
**Entry Point:** words_string
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def words_string(s):
    """
    You will be given a string of words separated by commas or spaces. Your task is
    to split the string into words and return an array of the words.
    
    For example:
    words_string("Hi, my name is John") == ["Hi", "my", "name", "is", "John"]
    words_string("One, two, three, four, five, six") == ["One", "two", "three", "four", "five", "six"]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if not s:
        return []

    s_list = []

    for letter in s:
        if letter == ',':
            s_list.append(' ')
        else:
            s_list.append(letter)

    s_list = "".join(s_list)
    return s_list.split()
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[(candidate["Hi, my name is John"]) = ("Hi";"my";"name";"is";"John")];
    .qython.assert[(candidate["One, two, three, four, five, six"]) = ("One";"two";"three";"four";"five";"six")];
    .qython.assert[(candidate["Hi, my name"]) = ("Hi";"my";"name")];
    .qython.assert[(candidate["One,, two, three, four, five, six,"]) = ("One";"two";"three";"four";"five";"six")];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[""] = ()];
    .qython.assert[(candidate["ahmed     , gamal"]) = ("ahmed";"gamal")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:101 -->
================================================================================

<!-- PROBLEM_START:102 -->
# Problem 102

<!-- META_START -->
**Task ID:** HumanEval/102
**Entry Point:** choose_num
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def choose_num(x, y):
    """This function takes two positive numbers x and y and returns the
    biggest even integer number that is in the range [x, y] inclusive;
    a number n is in the range [x, y] if x <= n <= y. If 
    there's no such number, then the function should return -1.

    For example:
    choose_num(12, 15) = 14
    choose_num(13, 12) = -1
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if x > y:
        return -1
    if y % 2 == 0:
        return y
    if x == y:
        return -1
    return y - 1
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[12;15] = 14];
    .qython.assert[candidate[13;12] = -1];
    .qython.assert[candidate[33;12354] = 12354];
    .qython.assert[candidate[5234;5233] = -1];
    .qython.assert[candidate[6;29] = 28];
    .qython.assert[candidate[27;10] = -1];
    .qython.assert[candidate[7;7] = -1];
    .qython.assert[candidate[546;546] = 546]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:102 -->
================================================================================

<!-- PROBLEM_START:103 -->
# Problem 103

<!-- META_START -->
**Task ID:** HumanEval/103
**Entry Point:** rounded_avg
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def rounded_avg(n, m):
    """You are given two positive integers n and m, and your task is to compute the
    average of the integers from n through m (including n and m). 
    Round the answer to the nearest integer and convert that to binary.
    If n is greater than m, return -1.
    Example:
    rounded_avg(1, 5) => "0b11"
    rounded_avg(7, 5) => -1
    rounded_avg(10, 20) => "0b1111"
    rounded_avg(20, 33) => "0b11010"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if m < n:
        return -1
    summation = 0
    for i in range(n, m+1):
        summation += i
    return bin(round(summation/(m - n + 1)))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[1;5] = "0b11"];
    .qython.assert[candidate[7;13] = "0b1010"];
    .qython.assert[candidate[964;977] = "0b1111001010"];
    .qython.assert[candidate[996;997] = "0b1111100100"];
    .qython.assert[candidate[560;851] = "0b1011000010"];
    .qython.assert[candidate[185;546] = "0b101101110"];
    .qython.assert[candidate[362;496] = "0b110101101"];
    .qython.assert[candidate[350;902] = "0b1001110010"];
    .qython.assert[candidate[197;233] = "0b11010111"];
    .qython.assert[candidate[7;5] = -1];
    .qython.assert[candidate[5;1] = -1];
    .qython.assert[candidate[5;5] = "0b101"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:103 -->
================================================================================

<!-- PROBLEM_START:104 -->
# Problem 104

<!-- META_START -->
**Task ID:** HumanEval/104
**Entry Point:** unique_digits
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def unique_digits(x):
    """Given a list of positive integers x. return a sorted list of all 
    elements that hasn't any even digit.

    Note: Returned list should be sorted in increasing order.
    
    For example:
    >>> unique_digits([15, 33, 1422, 1])
    [1, 15, 33]
    >>> unique_digits([152, 323, 1422, 10])
    []
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
odd_digit_elements = []
    for i in x:
        if all (int(c) % 2 == 1 for c in str(i)):
            odd_digit_elements.append(i)
    return sorted(odd_digit_elements)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(15;33;1422;1)] = (1;15;33)];
    .qython.assert[candidate[(152;323;1422;10)] = ()];
    .qython.assert[candidate[(12345;2033;111;151)] = (111;151)];
    .qython.assert[candidate[(135;103;31)] = (31;135)];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:104 -->
================================================================================

<!-- PROBLEM_START:105 -->
# Problem 105

<!-- META_START -->
**Task ID:** HumanEval/105
**Entry Point:** by_length
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def by_length(arr):
    """
    Given an array of integers, sort the integers that are between 1 and 9 inclusive,
    reverse the resulting array, and then replace each digit by its corresponding name from
    "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine".

    For example:
      arr = [2, 1, 1, 4, 5, 8, 2, 3]   
            -> sort arr -> [1, 1, 2, 2, 3, 4, 5, 8] 
            -> reverse arr -> [8, 5, 4, 3, 2, 2, 1, 1]
      return ["Eight", "Five", "Four", "Three", "Two", "Two", "One", "One"]
    
      If the array is empty, return an empty array:
      arr = []
      return []
    
      If the array has any strange number ignore it:
      arr = [1, -1 , 55] 
            -> sort arr -> [-1, 1, 55]
            -> reverse arr -> [55, 1, -1]
      return = ['One']
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
dic = {
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine",
    }
    sorted_arr = sorted(arr, reverse=True)
    new_arr = []
    for var in sorted_arr:
        try:
            new_arr.append(dic[var])
        except:
            pass
    return new_arr
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(2;1;1;4;5;8;2;3)] = ("Eight";"Five";"Four";"Three";"Two";"Two";"One";"One");"Error"];
    .qython.assert2[candidate[()] = ();"Error"];
    .qython.assert2[candidate[(1;-1;55)] = enlist "One";"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[(1;-1;3;2)] = ("Three";"Two";"One")];
    .qython.assert[candidate[(9;4;8)] = ("Nine";"Eight";"Four")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:105 -->
================================================================================

<!-- PROBLEM_START:106 -->
# Problem 106

<!-- META_START -->
**Task ID:** HumanEval/106
**Entry Point:** f
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def f(n):
    """ Implement the function f that takes n as a parameter,
    and returns a list of size n, such that the value of the element at index i is the factorial of i if i is even
    or the sum of numbers from 1 to i otherwise.
    i starts from 1.
    the factorial of i is the multiplication of the numbers from 1 to i (1 * 2 * ... * i).
    Example:
    f(5) == [1, 2, 6, 24, 15]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ret = []
    for i in range(1,n+1):
        if i%2 == 0:
            x = 1
            for j in range(1,i+1): x *= j
            ret += [x]
        else:
            x = 0
            for j in range(1,i+1): x += j
            ret += [x]
    return ret
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5] = (1;2;6;24;15)];
    .qython.assert[candidate[7] = (1;2;6;24;15;720;28)];
    .qython.assert[candidate[1] = enlist 1];
    .qython.assert[candidate[3] = (1;2;6)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:106 -->
================================================================================

<!-- PROBLEM_START:107 -->
# Problem 107

<!-- META_START -->
**Task ID:** HumanEval/107
**Entry Point:** even_odd_palindrome
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def even_odd_palindrome(n):
    """
    Given a positive integer n, return a tuple that has the number of even and odd
    integer palindromes that fall within the range(1, n), inclusive.

    Example 1:

        Input: 3
        Output: (1, 2)
        Explanation:
        Integer palindrome are 1, 2, 3. one of them is even, and two of them are odd.

    Example 2:

        Input: 12
        Output: (4, 6)
        Explanation:
        Integer palindrome are 1, 2, 3, 4, 5, 6, 7, 8, 9, 11. four of them are even, and 6 of them are odd.

    Note:
        1. 1 <= n <= 10^3
        2. returned tuple has the number of even and odd integer palindromes respectively.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def is_palindrome(n):
        return str(n) == str(n)[::-1]

    even_palindrome_count = 0
    odd_palindrome_count = 0

    for i in range(1, n+1):
        if i%2 == 1 and is_palindrome(i):
                odd_palindrome_count += 1
        elif i%2 == 0 and is_palindrome(i):
            even_palindrome_count += 1
    return (even_palindrome_count, odd_palindrome_count)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[123] = (8;13)];
    .qython.assert[candidate[12] = (4;6)];
    .qython.assert[candidate[3] = (1;2)];
    .qython.assert[candidate[63] = (6;8)];
    .qython.assert[candidate[25] = (5;6)];
    .qython.assert[candidate[19] = (4;6)];
    .qython.assert2[candidate[9] = (4;5);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1] = (0;1);"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:107 -->
================================================================================

<!-- PROBLEM_START:108 -->
# Problem 108

<!-- META_START -->
**Task ID:** HumanEval/108
**Entry Point:** count_nums
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def count_nums(arr):
    """
    Write a function count_nums which takes an array of integers and returns
    the number of elements which has a sum of digits > 0.
    If a number is negative, then its first signed digit will be negative:
    e.g. -123 has signed digits -1, 2, and 3.
    >>> count_nums([]) == 0
    >>> count_nums([-1, 11, -11]) == 1
    >>> count_nums([1, 1, 2]) == 3
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def digits_sum(n):
        neg = 1
        if n < 0: n, neg = -1 * n, -1 
        n = [int(i) for i in str(n)]
        n[0] = n[0] * neg
        return sum(n)
    return len(list(filter(lambda x: x > 0, [digits_sum(i) for i in arr])))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[()] = 0];
    .qython.assert[candidate[(-1;-2;0)] = 0];
    .qython.assert[candidate[(1;1;2;-2;3;4;5)] = 6];
    .qython.assert[candidate[(1;6;9;-6;0;1;5)] = 5];
    .qython.assert[candidate[(1;100;98;-7;1;-1)] = 4];
    .qython.assert[candidate[(12;23;34;-45;-56;0)] = 5];
    .qython.assert[(candidate[(-0;1 xexp 0)]) = 1];
    .qython.assert[(candidate[enlist 1]) = 1];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:108 -->
================================================================================

<!-- PROBLEM_START:109 -->
# Problem 109

<!-- META_START -->
**Task ID:** HumanEval/109
**Entry Point:** move_one_ball
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def move_one_ball(arr):
    """We have an array 'arr' of N integers arr[1], arr[2], ..., arr[N].The
    numbers in the array will be randomly ordered. Your task is to determine if
    it is possible to get an array sorted in non-decreasing order by performing 
    the following operation on the given array:
        You are allowed to perform right shift operation any number of times.
    
    One right shift operation means shifting all elements of the array by one
    position in the right direction. The last element of the array will be moved to
    the starting position in the array i.e. 0th index. 

    If it is possible to obtain the sorted array by performing the above operation
    then return True else return False.
    If the given array is empty then return True.

    Note: The given list is guaranteed to have unique elements.

    For Example:
    
    move_one_ball([3, 4, 5, 1, 2])==>True
    Explanation: By performing 2 right shift operations, non-decreasing order can
                 be achieved for the given array.
    move_one_ball([3, 5, 4, 1, 2])==>False
    Explanation: It is not possible to get non-decreasing order for the given
                array by performing any number of right shift operations.
                
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if len(arr)==0:
      return True
    sorted_array=sorted(arr)
    my_arr=[]
    
    min_value=min(arr)
    min_index=arr.index(min_value)
    my_arr=arr[min_index:]+arr[0:min_index]
    for i in range(len(arr)):
      if my_arr[i]!=sorted_array[i]:
        return False
    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[(3;4;5;1;2)] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(3;5;10;1;2)] = 1b];
    .qython.assert[candidate[(4;3;1;2)] = 0b];
    .qython.assert2[candidate[(3;5;4;1;2)] = 0b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[()] = 1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:109 -->
================================================================================

<!-- PROBLEM_START:110 -->
# Problem 110

<!-- META_START -->
**Task ID:** HumanEval/110
**Entry Point:** exchange
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def exchange(lst1, lst2):
    """In this problem, you will implement a function that takes two lists of numbers,
    and determines whether it is possible to perform an exchange of elements
    between them to make lst1 a list of only even numbers.
    There is no limit on the number of exchanged elements between lst1 and lst2.
    If it is possible to exchange elements between the lst1 and lst2 to make
    all the elements of lst1 to be even, return "YES".
    Otherwise, return "NO".
    For example:
    exchange([1, 2, 3, 4], [1, 2, 3, 4]) => "YES"
    exchange([1, 2, 3, 4], [1, 5, 3, 4]) => "NO"
    It is assumed that the input lists will be non-empty.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
odd = 0
    even = 0
    for i in lst1:
        if i%2 == 1:
            odd += 1
    for i in lst2:
        if i%2 == 0:
            even += 1
    if even >= odd:
        return "YES"
    return "NO"
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;3;4);(1;2;3;4)] = "YES"];
    .qython.assert[candidate[(1;2;3;4);(1;5;3;4)] = "NO"];
    .qython.assert[candidate[(1;2;3;4);(2;1;4;3)] = "YES"];
    .qython.assert[candidate[(5;7;3);(2;6;4)] = "YES"];
    .qython.assert[candidate[(5;7;3);(2;6;3)] = "NO"];
    .qython.assert[candidate[(3;2;6;1;8;9);(3;5;5;1;1;1)] = "NO"];
    .qython.assert[candidate[(100;200);(200;200)] = "YES"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:110 -->
================================================================================

<!-- PROBLEM_START:111 -->
# Problem 111

<!-- META_START -->
**Task ID:** HumanEval/111
**Entry Point:** histogram
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def histogram(test):
    """Given a string representing a space separated lowercase letters, return a dictionary
    of the letter with the most repetition and containing the corresponding count.
    If several letters have the same occurrence, return all of them.
    
    Example:
    histogram('a b c') == {'a': 1, 'b': 1, 'c': 1}#single-char
    histogram('a b b a') == {'a': 2, 'b': 2}#single-char
    histogram('a b c a b') == {'a': 2, 'b': 2}#single-char
    histogram('b b b b a') == {'b': 4}#single-char
    histogram('') == {}

    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
dict1={}
    list1=test.split(" ")
    t=0

    for i in list1:
        if(list1.count(i)>t) and i!='':
            t=list1.count(i)
    if t>0:
        for i in list1:
            if(list1.count(i)==t):
                
                dict1[i]=t
    return dict1
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[(candidate["a b b a"]) = ("a";"b")!(2;2);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[(candidate["a b c a b"]) = ("a";"b")!(2;2);"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[(candidate["a b c d g"]) = ("a";"b";"c";"d";"g")!(1;1;1;1;1);"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[(candidate["r t g"]) = ("r";"t";"g")!(1;1;1);"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[(candidate["b b b b a"]) = (enlist "b")!(enlist 4);"This prints if this assert fails 5 (good for debugging!)"];
    .qython.assert2[(candidate["r t g"]) = ("r";"t";"g")!(1;1;1);"This prints if this assert fails 6 (good for debugging!)"];
    .qython.assert2[candidate[""] = ()!();"This prints if this assert fails 7 (also good for debugging!)"];
    .qython.assert2[candidate["a"] = (enlist "a")!(enlist 1);"This prints if this assert fails 8 (also good for debugging!)"]
    }
/single-char
```
<!-- TEST_END -->

<!-- PROBLEM_END:111 -->
================================================================================

<!-- PROBLEM_START:112 -->
# Problem 112

<!-- META_START -->
**Task ID:** HumanEval/112
**Entry Point:** reverse_delete
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def reverse_delete(s,c):
    """Task
    We are given two strings s and c, you have to deleted all the characters in s that are equal to any character in c
    then check if the result string is palindrome.
    A string is called palindrome if it reads the same backward as forward.
    You should return a tuple containing the result string and True/False for the check.
    Example
    For s = "abcde", c = "ae", the result should be ('bcd',False)
    For s = "abcdef", c = "b"  the result should be ('acdef',False)
    For s = "abcdedcba", c = "ab", the result should be ('cdedc',True)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
s = ''.join([char for char in s if char not in c])
    return (s,s[::-1] == s)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["abcde";"ae"] = ("bcd";0b)];
    .qython.assert[candidate["abcdef";enlist["b"]] = ("acdef";0b)];
    .qython.assert[candidate["abcdedcba";"ab"] = ("cdedc";1b)];
    .qython.assert[candidate["dwik";enlist["w"]] = ("dik";0b)];
    .qython.assert[candidate[enlist["a"];enlist["a"]] = ("";1b)];
    .qython.assert[candidate["abcdedcba";""] = ("abcdedcba";1b)];
    .qython.assert[candidate["abcdedcba";enlist["v"]] = ("abcdedcba";1b)];
    .qython.assert[candidate["vabba";enlist["v"]] = ("abba";1b)];
    .qython.assert[candidate["mamma";"mia"] = ("";1b)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:112 -->
================================================================================

<!-- PROBLEM_START:113 -->
# Problem 113

<!-- META_START -->
**Task ID:** HumanEval/113
**Entry Point:** odd_count
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def odd_count(lst):
    """Given a list of strings, where each string consists of only digits, return a list.
    Each element i of the output should be "the number of odd elements in the
    string i of the input." where all the i's should be replaced by the number
    of odd digits in the i'th string of the input.

    >>> odd_count(['1234567'])
    ["the number of odd elements 4n the str4ng 4 of the 4nput."]
    >>> odd_count(['3',"11111111"])
    ["the number of odd elements 1n the str1ng 1 of the 1nput.",
     "the number of odd elements 8n the str8ng 8 of the 8nput."]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
res = []
    for arr in lst:
        n = sum(int(d)%2==1 for d in arr)
        res.append("the number of odd elements " + str(n) + "n the str"+ str(n) +"ng "+ str(n) +" of the "+ str(n) +"nput.")
    return res
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[(candidate[enlist "1234567"]) = enlist ("the number of odd elements 4n the str4ng 4 of the 4nput.");"Test 1"];
    .qython.assert2[candidate[(enlist["3"];"11111111")] = (("the number of odd elements 1n the str1ng 1 of the 1nput.");("the number of odd elements 8n the str8ng 8 of the 8nput."));"Test 2"];
    .qython.assert[candidate[("271";"137";"314")] = (("the number of odd elements 2n the str2ng 2 of the 2nput.");("the number of odd elements 3n the str3ng 3 of the 3nput.");("the number of odd elements 2n the str2ng 2 of the 2nput."))];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:113 -->
================================================================================

<!-- PROBLEM_START:114 -->
# Problem 114

<!-- META_START -->
**Task ID:** HumanEval/114
**Entry Point:** minSubArraySum
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def minSubArraySum(nums):
    """
    Given an array of integers nums, find the minimum sum of any non-empty sub-array
    of nums.
    Example
    minSubArraySum([2, 3, 4, 1, 2, 4]) == 1
    minSubArraySum([-1, -2, -3]) == -6
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
max_sum = 0
    s = 0
    for num in nums:
        s += -num
        if (s < 0):
            s = 0
        max_sum = max(s, max_sum)
    if max_sum == 0:
        max_sum = max(-i for i in nums)
    min_sum = -max_sum
    return min_sum
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[(2;3;4;1;2;4)] = 1;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(-1;-2;-3)] = -6];
    .qython.assert[candidate[(-1;-2;-3;2;-10)] = -14];
    .qython.assert[(candidate[enlist -9999999999999999]) = -9999999999999999];
    .qython.assert[candidate[(0;10;20;1000000)] = 0];
    .qython.assert[candidate[(-1;-2;-3;10;-5)] = -6];
    .qython.assert[candidate[(100;-1;-2;-3;10;-5)] = -6];
    .qython.assert[candidate[(10;11;13;8;3;4)] = 3];
    .qython.assert[candidate[(100;-33;32;-1;0;-2)] = -33];
    .qython.assert2[(candidate[enlist -10]) = -10;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[(candidate[enlist 7]) = 7];
    .qython.assert[candidate[(1;-1)] = -1]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:114 -->
================================================================================

<!-- PROBLEM_START:115 -->
# Problem 115

<!-- META_START -->
**Task ID:** HumanEval/115
**Entry Point:** max_fill
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def max_fill(grid, capacity):
    """
    You are given a rectangular grid of wells. Each row represents a single well,
    and each 1 in a row represents a single unit of water.
    Each well has a corresponding bucket that can be used to extract water from it, 
    and all buckets have the same capacity.
    Your task is to use the buckets to empty the wells.
    Output the number of times you need to lower the buckets.

    Example 1:
        Input: 
            grid : [[0,0,1,0], [0,1,0,0], [1,1,1,1]]
            bucket_capacity : 1
        Output: 6

    Example 2:
        Input: 
            grid : [[0,0,1,1], [0,0,0,0], [1,1,1,1], [0,1,1,1]]
            bucket_capacity : 2
        Output: 5
    
    Example 3:
        Input: 
            grid : [[0,0,0], [0,0,0]]
            bucket_capacity : 5
        Output: 0

    Constraints:
        * all wells have the same length
        * 1 <= grid.length <= 10^2
        * 1 <= grid[:,1].length <= 10^2
        * grid[i][j] -> 0 | 1
        * 1 <= capacity <= 10
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import math
    return sum([math.ceil(sum(arr)/capacity) for arr in grid])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[((0;0;1;0);(0;1;0;0);(1;1;1;1));1] = 6;"Error"];
    .qython.assert2[candidate[((0;0;1;1);(0;0;0;0);(1;1;1;1);(0;1;1;1));2] = 5;"Error"];
    .qython.assert2[candidate[((0;0;0);(0;0;0));5] = 0;"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[((1;1;1;1);(1;1;1;1));2] = 4;"Error"];
    .qython.assert2[candidate[((1;1;1;1);(1;1;1;1));9] = 2;"Error"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:115 -->
================================================================================

<!-- PROBLEM_START:116 -->
# Problem 116

<!-- META_START -->
**Task ID:** HumanEval/116
**Entry Point:** sort_array
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sort_array(arr):
    """
    In this Kata, you have to sort an array of non-negative integers according to
    number of ones in their binary representation in ascending order.
    For similar number of ones, sort based on decimal value.

    It must be implemented like this:
    >>> sort_array([1, 5, 2, 3, 4]) == [1, 2, 3, 4, 5]
    >>> sort_array([1, 0, 2, 3, 4]) == [0, 1, 2, 3, 4]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sorted(sorted(arr), key=lambda x: bin(x)[2:].count('1'))
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(1;5;2;3;4)] = (1;2;4;3;5)];
    .qython.assert[candidate[(1;0;2;3;4)] = (0;1;2;4;3)];
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(2;5;77;4;5;3;5;7;2;3;4)] = (2;2;4;4;3;3;5;5;5;7;77)];
    .qython.assert[candidate[(3;6;44;12;32;5)] = (32;3;5;6;12;44)];
    .qython.assert[candidate[(2;4;8;16;32)] = (2;4;8;16;32)];
    .qython.assert[candidate[(2;4;8;16;32)] = (2;4;8;16;32)];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:116 -->
================================================================================

<!-- PROBLEM_START:117 -->
# Problem 117

<!-- META_START -->
**Task ID:** HumanEval/117
**Entry Point:** select_words
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def select_words(s, n):
    """Given a string s and a natural number n, you have been tasked to implement 
    a function that returns a list of all words from string s that contain exactly 
    n consonants, in order these words appear in the string s.
    If the string s is empty then the function should return an empty list.
    Note: you may assume the input string contains only letters and spaces.
    Examples:
    select_words("Mary had a little lamb", 4) ==> ["little"]
    select_words("Mary had a little lamb", 3) ==> ["Mary", "lamb"]
    select_words("simple white space", 2) ==> []
    select_words("Hello world", 4) ==> ["world"]
    select_words("Uncle sam", 3) ==> ["Uncle"]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
result = []
    for word in s.split():
        n_consonants = 0
        for i in range(0, len(word)):
            if word[i].lower() not in ["a","e","i","o","u"]:
                n_consonants += 1 
        if n_consonants == n:
            result.append(word)
    return result
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[(candidate["Mary had a little lamb";4]) = enlist "little";raze[("First test error: ";.qython.String[candidate["Mary had a little lamb";4]])]];
    .qython.assert2[(candidate["Mary had a little lamb";3]) = ("Mary";"lamb");raze[("Second test error: ";.qython.String[candidate["Mary had a little lamb";3]])]];
    .qython.assert2[(candidate["simple white space";2]) = ();raze[("Third test error: ";.qython.String[candidate["simple white space";2]])]];
    .qython.assert2[(candidate["Hello world";4]) = enlist "world";raze[("Fourth test error: ";.qython.String[candidate["Hello world";4]])]];
    .qython.assert2[(candidate["Uncle sam";3]) = enlist "Uncle";raze[("Fifth test error: ";.qython.String[candidate["Uncle sam";3]])]];
    .qython.assert2[candidate["";4] = ();raze[("1st edge test error: ";.qython.String[candidate["";4]])]];
    .qython.assert2[(candidate["a b c d e f";1]) = (enlist["b"];enlist["c"];enlist["d"];enlist["f"]);raze[("2nd edge test error: ";.qython.String[candidate["a b c d e f";1]])]]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:117 -->
================================================================================

<!-- PROBLEM_START:118 -->
# Problem 118

<!-- META_START -->
**Task ID:** HumanEval/118
**Entry Point:** get_closest_vowel
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def get_closest_vowel(word):
    """You are given a word. Your task is to find the closest vowel that stands between 
    two consonants from the right side of the word (case sensitive).
    
    Vowels in the beginning and ending doesn't count. Return empty string if you didn't
    find any vowel met the above condition. 

    You may assume that the given string contains English letter only.

    Example:
    get_closest_vowel("yogurt") ==> "u"
    get_closest_vowel("FULL") ==> "U"
    get_closest_vowel("quick") ==> ""
    get_closest_vowel("ab") ==> ""
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if len(word) < 3:
        return ""

    vowels = {"a", "e", "i", "o", "u", "A", "E", 'O', 'U', 'I'}
    for i in range(len(word)-2, 0, -1):
        if word[i] in vowels:
            if (word[i+1] not in vowels) and (word[i-1] not in vowels):
                return word[i]
    return ""
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["yogurt"] = enlist["u"]];
    .qython.assert[candidate["full"] = enlist["u"]];
    .qython.assert[candidate["easy"] = ""];
    .qython.assert[candidate["eAsy"] = ""];
    .qython.assert[candidate["ali"] = ""];
    .qython.assert[candidate["bad"] = enlist["a"]];
    .qython.assert[candidate["most"] = enlist["o"]];
    .qython.assert[candidate["ab"] = ""];
    .qython.assert[candidate["ba"] = ""];
    .qython.assert[candidate["quick"] = ""];
    .qython.assert[candidate["anime"] = enlist["i"]];
    .qython.assert[candidate["Asia"] = ""];
    .qython.assert[candidate["Above"] = enlist["o"]];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:118 -->
================================================================================

<!-- PROBLEM_START:119 -->
# Problem 119

<!-- META_START -->
**Task ID:** HumanEval/119
**Entry Point:** match_parens
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def match_parens(lst):
    '''
    You are given a list of two strings, both strings consist of open
    parentheses '(' or close parentheses ')' only.
    Your job is to check if it is possible to concatenate the two strings in
    some order, that the resulting string will be good.
    A string S is considered to be good if and only if all parentheses in S
    are balanced. For example: the string '(())()' is good, while the string
    '())' is not.
    Return 'Yes' if there's a way to make a good string, and return 'No' otherwise.

    Examples:
    match_parens(['()(', ')']) == 'Yes'
    match_parens([')', ')']) == 'No'
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def check(s):
        val = 0
        for i in s:
            if i == '(':
                val = val + 1
            else:
                val = val - 1
            if val < 0:
                return False
        return True if val == 0 else False

    S1 = lst[0] + lst[1]
    S2 = lst[1] + lst[0]
    return 'Yes' if check(S1) or check(S2) else 'No'
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[("()(";enlist[")"])] = "Yes"];
    .qython.assert[candidate[(enlist[")"];enlist[")"])] = "No"];
    .qython.assert[candidate[("(()(())";"())())")] = "No"];
    .qython.assert[candidate[(")())";"(()()(")] = "Yes"];
    .qython.assert[candidate[("(())))";"(()())((")] = "Yes"];
    .qython.assert[candidate[("()";"())")] = "No"];
    .qython.assert[candidate[("(()(";"()))()")] = "Yes"];
    .qython.assert[candidate[("((((";"((())")] = "No"];
    .qython.assert[candidate[(")(()";"(()(")] = "No"];
    .qython.assert[candidate[(")(";")(")] = "No"];
    .qython.assert[candidate[(enlist["("];enlist[")"])] = "Yes"];
    .qython.assert[candidate[(enlist[")"];enlist["("])] = "Yes"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:119 -->
================================================================================

<!-- PROBLEM_START:120 -->
# Problem 120

<!-- META_START -->
**Task ID:** HumanEval/120
**Entry Point:** maximum
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def maximum(arr, k):
    """
    Given an array arr of integers and a positive integer k, return a sorted list 
    of length k with the maximum k numbers in arr.

    Example 1:

        Input: arr = [-3, -4, 5], k = 3
        Output: [-4, -3, 5]

    Example 2:

        Input: arr = [4, -4, 4], k = 2
        Output: [4, 4]

    Example 3:

        Input: arr = [-3, 2, 1, 2, -1, -2, 1], k = 1
        Output: [2]

    Note:
        1. The length of the array will be in the range of [1, 1000].
        2. The elements in the array will be in the range of [-1000, 1000].
        3. 0 <= k <= len(arr)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if k == 0:
        return []
    arr.sort()
    ans = arr[-k:]
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(-3;-4;5);3] = (-4;-3;5)];
    .qython.assert[candidate[(4;-4;4);2] = (4;4)];
    .qython.assert[candidate[(-3;2;1;2;-1;-2;1);1] = enlist 2];
    .qython.assert[candidate[(123;-123;20;0;1;2;-3);3] = (2;20;123)];
    .qython.assert[candidate[(-123;20;0;1;2;-3);4] = (0;1;2;20)];
    .qython.assert[candidate[(5;15;0;3;-13;-8;0);7] = (-13;-8;0;0;3;5;15)];
    .qython.assert[candidate[(-1;0;2;5;3;-10);2] = (3;5)];
    .qython.assert[candidate[(1;0;5;-7);1] = enlist 5];
    .qython.assert[candidate[(4;-4);2] = (-4;4)];
    .qython.assert[candidate[(-10;10);2] = (-10;10)];
    .qython.assert[candidate[(1;2;3;-23;243;-400;0);0] = ()]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:120 -->
================================================================================

<!-- PROBLEM_START:121 -->
# Problem 121

<!-- META_START -->
**Task ID:** HumanEval/121
**Entry Point:** solution
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def solution(lst):
    """Given a non-empty list of integers, return the sum of all of the odd elements that are in even positions.
    

    Examples
    solution([5, 8, 7, 1]) ==> 12
    solution([3, 3, 3, 3, 3]) ==> 9
    solution([30, 13, 24, 321]) ==>0
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sum([x for idx, x in enumerate(lst) if idx%2==0 and x%2==1])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(5;8;7;1)] = 12];
    .qython.assert[candidate[(3;3;3;3;3)] = 9];
    .qython.assert[candidate[(30;13;24;321)] = 0];
    .qython.assert[candidate[(5;9)] = 5];
    .qython.assert[candidate[(2;4;8)] = 0];
    .qython.assert[candidate[(30;13;23;32)] = 23];
    .qython.assert[candidate[(3;13;2;9)] = 3]
    }    / Check some edge cases that are easy to work out by hand.
```
<!-- TEST_END -->

<!-- PROBLEM_END:121 -->
================================================================================

<!-- PROBLEM_START:122 -->
# Problem 122

<!-- META_START -->
**Task ID:** HumanEval/122
**Entry Point:** add_elements
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def add_elements(arr, k):
    """
    Given a non-empty array of integers arr and an integer k, return
    the sum of the elements with at most two digits from the first k elements of arr.

    Example:

        Input: arr = [111,21,3,4000,5,6,7,8,9], k = 4
        Output: 24 # sum of 21 + 3

    Constraints:
        1. 1 <= len(arr) <= 100
        2. 1 <= k <= len(arr)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sum(elem for elem in arr[:k] if len(str(elem)) <= 2)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;-2;-3;41;57;76;87;88;99);3] = -4];
    .qython.assert[candidate[(111;121;3;4000;5;6);2] = 0];
    .qython.assert[candidate[(11;21;3;90;5;6;7;8;9);4] = 125];
    .qython.assert2[candidate[(111;21;3;4000;5;6;7;8;9);4] = 24;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[(candidate[enlist 1;1]) = 1;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:122 -->
================================================================================

<!-- PROBLEM_START:123 -->
# Problem 123

<!-- META_START -->
**Task ID:** HumanEval/123
**Entry Point:** get_odd_collatz
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def get_odd_collatz(n):
    """
    Given a positive integer n, return a sorted list that has the odd numbers in collatz sequence.

    The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined
    as follows: start with any positive integer n. Then each term is obtained from the 
    previous term as follows: if the previous term is even, the next term is one half of 
    the previous term. If the previous term is odd, the next term is 3 times the previous
    term plus 1. The conjecture is that no matter what value of n, the sequence will always reach 1.

    Note: 
        1. Collatz(1) is [1].
        2. returned list sorted in increasing order.

    For example:
    get_odd_collatz(5) returns [1, 5] # The collatz sequence for 5 is [5, 16, 8, 4, 2, 1], so the odd numbers are only 1, and 5.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n%2==0:
        odd_collatz = [] 
    else:
        odd_collatz = [n]
    while n > 1:
        if n % 2 == 0:
            n = n/2
        else:
            n = n*3 + 1
            
        if n%2 == 1:
            odd_collatz.append(int(n))

    return sorted(odd_collatz)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[14] = (1;5;7;11;13;17)];
    .qython.assert[candidate[5] = (1;5)];
    .qython.assert2[candidate[12] = (1;3;5);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[1] = enlist 1;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:123 -->
================================================================================

<!-- PROBLEM_START:124 -->
# Problem 124

<!-- META_START -->
**Task ID:** HumanEval/124
**Entry Point:** valid_date
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def valid_date(date):
    """You have to write a function which validates a given date string and
    returns True if the date is valid otherwise False.
    The date is valid if all of the following rules are satisfied:
    1. The date string is not empty.
    2. The number of days is not less than 1 or higher than 31 days for months 1,3,5,7,8,10,12. And the number of days is not less than 1 or higher than 30 days for months 4,6,9,11. And, the number of days is not less than 1 or higher than 29 for the month 2.
    3. The months should not be less than 1 or higher than 12.
    4. The date should be in the format: mm-dd-yyyy

    for example: 
    valid_date('03-11-2000') => True

    valid_date('15-01-2012') => False

    valid_date('04-0-2040') => False

    valid_date('06-04-2020') => True

    valid_date('06/04/2020') => False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
try:
        date = date.strip()
        month, day, year = date.split('-')
        month, day, year = int(month), int(day), int(year)
        if month < 1 or month > 12:
            return False
        if month in [1,3,5,7,8,10,12] and day < 1 or day > 31:
            return False
        if month in [4,6,9,11] and day < 1 or day > 30:
            return False
        if month == 2 and day < 1 or day > 29:
            return False
    except:
        return False

    return True
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["03-11-2000"] = 1b];
    .qython.assert[candidate["15-01-2012"] = 0b];
    .qython.assert[candidate["04-0-2040"] = 0b];
    .qython.assert[candidate["06-04-2020"] = 1b];
    .qython.assert[candidate["01-01-2007"] = 1b];
    .qython.assert[candidate["03-32-2011"] = 0b];
    .qython.assert[candidate[""] = 0b];
    .qython.assert[candidate["04-31-3000"] = 0b];
    .qython.assert[candidate["06-06-2005"] = 1b];
    .qython.assert[candidate["21-31-2000"] = 0b];
    .qython.assert[candidate["04-12-2003"] = 1b];
    .qython.assert[candidate["04122003"] = 0b];
    .qython.assert[candidate["20030412"] = 0b];
    .qython.assert[candidate["2003-04"] = 0b];
    .qython.assert[candidate["2003-04-12"] = 0b];
    .qython.assert[candidate["04-2003"] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:124 -->
================================================================================

<!-- PROBLEM_START:125 -->
# Problem 125

<!-- META_START -->
**Task ID:** HumanEval/125
**Entry Point:** split_words
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def split_words(txt):
    '''
    Given a string of words, return a list of words split on whitespace, if no whitespaces exists in the text you
    should split on commas ',' if no commas exists you should return the number of lower-case letters with odd order in the
    alphabet, ord('a') = 0, ord('b') = 1, ... ord('z') = 25
    Examples
    split_words("Hello world!") ➞ ["Hello", "world!"]
    split_words("Hello,world!") ➞ ["Hello", "world!"]
    split_words("abcdef") == 3 
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if " " in txt:
        return txt.split()
    elif "," in txt:
        return txt.replace(',',' ').split()
    else:
        return len([i for i in txt if i.islower() and ord(i)%2 == 0])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate["Hello world!"]) = ("Hello";"world!")];
    .qython.assert[candidate["Hello,world!"] = ("Hello";"world!")];
    .qython.assert[(candidate["Hello world,!"]) = ("Hello";"world,!")];
    .qython.assert[(candidate["Hello,Hello,world !"]) = ("Hello,Hello,world";enlist["!"])];
    .qython.assert[candidate["abcdef"] = 3];
    .qython.assert[candidate["aaabb"] = 2];
    .qython.assert[candidate["aaaBb"] = 1];
    .qython.assert[candidate[""] = 0]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:125 -->
================================================================================

<!-- PROBLEM_START:126 -->
# Problem 126

<!-- META_START -->
**Task ID:** HumanEval/126
**Entry Point:** is_sorted
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_sorted(lst):
    '''
    Given a list of numbers, return whether or not they are sorted
    in ascending order. If list has more than 1 duplicate of the same
    number, return False. Assume no negative numbers and only integers.

    Examples
    is_sorted([5]) ➞ True
    is_sorted([1, 2, 3, 4, 5]) ➞ True
    is_sorted([1, 3, 2, 4, 5]) ➞ False
    is_sorted([1, 2, 3, 4, 5, 6]) ➞ True
    is_sorted([1, 2, 3, 4, 5, 6, 7]) ➞ True
    is_sorted([1, 3, 2, 4, 5, 6, 7]) ➞ False
    is_sorted([1, 2, 2, 3, 3, 4]) ➞ True
    is_sorted([1, 2, 2, 2, 3, 4]) ➞ False
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
count_digit = dict([(i, 0) for i in lst])
    for i in lst:
        count_digit[i]+=1 
    if any(count_digit[i] > 2 for i in lst):
        return False
    if all(lst[i-1] <= lst[i] for i in range(1, len(lst))):
        return True
    else:
        return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate[enlist 5]) = 1b];
    .qython.assert[candidate[(1;2;3;4;5)] = 1b];
    .qython.assert[candidate[(1;3;2;4;5)] = 0b];
    .qython.assert[candidate[(1;2;3;4;5;6)] = 1b];
    .qython.assert[candidate[(1;2;3;4;5;6;7)] = 1b];
    .qython.assert2[candidate[(1;3;2;4;5;6;7)] = 0b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[()] = 1b;"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[(candidate[enlist 1]) = 1b;"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[(3;2;1)] = 0b;"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;2;2;3;4)] = 0b;"This prints if this assert fails 5 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;3;3;4)] = 0b;"This prints if this assert fails 6 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;2;3;3;4)] = 1b;"This prints if this assert fails 7 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;4)] = 1b;"This prints if this assert fails 8 (good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:126 -->
================================================================================

<!-- PROBLEM_START:127 -->
# Problem 127

<!-- META_START -->
**Task ID:** HumanEval/127
**Entry Point:** intersection
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def intersection(interval1, interval2):
    """You are given two intervals,
    where each interval is a pair of integers. For example, interval = (start, end) = (1, 2).
    The given intervals are closed which means that the interval (start, end)
    includes both start and end.
    For each given interval, it is assumed that its start is less or equal its end.
    Your task is to determine whether the length of intersection of these two 
    intervals is a prime number.
    Example, the intersection of the intervals (1, 3), (2, 4) is (2, 3)
    which its length is 1, which not a prime number.
    If the length of the intersection is a prime number, return "YES",
    otherwise, return "NO".
    If the two intervals don't intersect, return "NO".


    [input/output] samples:
    intersection((1, 2), (2, 3)) ==> "NO"
    intersection((-1, 1), (0, 4)) ==> "NO"
    intersection((-3, -1), (-5, 5)) ==> "YES"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def is_prime(num):
        if num == 1 or num == 0:
            return False
        if num == 2:
            return True
        for i in range(2, num):
            if num%i == 0:
                return False
        return True

    l = max(interval1[0], interval2[0])
    r = min(interval1[1], interval2[1])
    length = r - l
    if length > 0 and is_prime(length):
        return "YES"
    return "NO"
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2);(2;3)] = "NO"];
    .qython.assert[candidate[(-1;1);(0;4)] = "NO"];
    .qython.assert[candidate[(-3;-1);(-5;5)] = "YES"];
    .qython.assert[candidate[(-2;2);(-4;0)] = "YES"];
    .qython.assert[candidate[(-11;2);(-1;-1)] = "NO"];
    .qython.assert[candidate[(1;2);(3;5)] = "NO"];
    .qython.assert[candidate[(1;2);(1;2)] = "NO"];
    .qython.assert[candidate[(-2;-2);(-3;-2)] = "NO"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:127 -->
================================================================================

<!-- PROBLEM_START:128 -->
# Problem 128

<!-- META_START -->
**Task ID:** HumanEval/128
**Entry Point:** prod_signs
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def prod_signs(arr):
    """
    You are given an array arr of integers and you need to return
    sum of magnitudes of integers multiplied by product of all signs
    of each number in the array, represented by 1, -1 or 0.
    Note: return None for empty arr.

    Example:
    >>> prod_signs([1, 2, 2, -4]) == -9
    >>> prod_signs([0, 1]) == 0
    >>> prod_signs([]) == None
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if not arr: return None
    prod = 0 if 0 in arr else (-1) ** len(list(filter(lambda x: x < 0, arr)))
    return prod * sum([abs(i) for i in arr])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[(1;2;2;-4)] = -9];
    .qython.assert[candidate[(0;1)] = 0];
    .qython.assert[candidate[(1;1;1;2;3;-1;1)] = -10];
    .qython.assert[candidate[()] = (::)];
    .qython.assert[candidate[(2;4;1;2;-1;-1;9)] = 20];
    .qython.assert[candidate[(-1;1;-1;1)] = 4];
    .qython.assert[candidate[(-1;1;1;1)] = -4];
    .qython.assert[candidate[(-1;1;1;0)] = 0];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:128 -->
================================================================================

<!-- PROBLEM_START:129 -->
# Problem 129

<!-- META_START -->
**Task ID:** HumanEval/129
**Entry Point:** minPath
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def minPath(grid, k):
    """
    Given a grid with N rows and N columns (N >= 2) and a positive integer k, 
    each cell of the grid contains a value. Every integer in the range [1, N * N]
    inclusive appears exactly once on the cells of the grid.

    You have to find the minimum path of length k in the grid. You can start
    from any cell, and in each step you can move to any of the neighbor cells,
    in other words, you can go to cells which share an edge with you current
    cell.
    Please note that a path of length k means visiting exactly k cells (not
    necessarily distinct).
    You CANNOT go off the grid.
    A path A (of length k) is considered less than a path B (of length k) if
    after making the ordered lists of the values on the cells that A and B go
    through (let's call them lst_A and lst_B), lst_A is lexicographically less
    than lst_B, in other words, there exist an integer index i (1 <= i <= k)
    such that lst_A[i] < lst_B[i] and for any j (1 <= j < i) we have
    lst_A[j] = lst_B[j].
    It is guaranteed that the answer is unique.
    Return an ordered list of the values on the cells that the minimum path go through.

    Examples:

        Input: grid = [ [1,2,3], [4,5,6], [7,8,9]], k = 3
        Output: [1, 2, 1]

        Input: grid = [ [5,9,3], [4,1,6], [7,8,2]], k = 1
        Output: [1]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
n = len(grid)
    val = n * n + 1
    for i in range(n):
        for j in range(n):
            if grid[i][j] == 1:
                temp = []
                if i != 0:
                    temp.append(grid[i - 1][j])

                if j != 0:
                    temp.append(grid[i][j - 1])

                if i != n - 1:
                    temp.append(grid[i + 1][j])

                if j != n - 1:
                    temp.append(grid[i][j + 1])

                val = min(temp)

    ans = []
    for i in range(k):
        if i % 2 == 0:
            ans.append(1)
        else:
            ans.append(val)
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[((1;2;3);(4;5;6);(7;8;9));3] = (1;2;1)];
    .qython.assert[candidate[((5;9;3);(4;1;6);(7;8;2));1] = enlist 1];
    .qython.assert[candidate[((1;2;3;4);(5;6;7;8);(9;10;11;12);(13;14;15;16));4] = (1;2;1;2)];
    .qython.assert[candidate[((6;4;13;10);(5;7;12;1);(3;16;11;15);(8;14;9;2));7] = (1;10;1;10;1;10;1)];
    .qython.assert[candidate[((8;14;9;2);(6;4;13;15);(5;7;1;12);(3;10;11;16));5] = (1;7;1;7;1)];
    .qython.assert[candidate[((11;8;7;2);(5;16;14;4);(9;3;15;6);(12;13;10;1));9] = (1;6;1;6;1;6;1;6;1)];
    .qython.assert[candidate[((12;13;10;1);(9;3;15;6);(5;16;14;4);(11;8;7;2));12] = (1;6;1;6;1;6;1;6;1;6;1;6)];
    .qython.assert[candidate[((2;7;4);(3;1;5);(6;8;9));8] = (1;3;1;3;1;3;1;3)];
    .qython.assert[candidate[((6;1;5);(3;8;9);(2;7;4));8] = (1;5;1;5;1;5;1;5)];
    .qython.assert[candidate[((1;2);(3;4));10] = (1;2;1;2;1;2;1;2;1;2)];
    .qython.assert[candidate[((1;3);(3;2));10] = (1;3;1;3;1;3;1;3;1;3)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:129 -->
================================================================================

<!-- PROBLEM_START:130 -->
# Problem 130

<!-- META_START -->
**Task ID:** HumanEval/130
**Entry Point:** tri
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def tri(n):
    """Everyone knows Fibonacci sequence, it was studied deeply by mathematicians in 
    the last couple centuries. However, what people don't know is Tribonacci sequence.
    Tribonacci sequence is defined by the recurrence:
    tri(1) = 3
    tri(n) = 1 + n / 2, if n is even.
    tri(n) =  tri(n - 1) + tri(n - 2) + tri(n + 1), if n is odd.
    For example:
    tri(2) = 1 + (2 / 2) = 2
    tri(4) = 3
    tri(3) = tri(2) + tri(1) + tri(4)
           = 2 + 3 + 3 = 8 
    You are given a non-negative integer number n, you have to a return a list of floats of the 
    first n + 1 numbers of the Tribonacci sequence.
    Examples:
    tri(3) => [1.0, 3.0, 2.0, 8.0]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n == 0:
        return [1]
    my_tri = [1, 3]
    for i in range(2, n + 1):
        if i % 2 == 0:
            my_tri.append(i / 2 + 1)
        else:
            my_tri.append(my_tri[i - 1] + my_tri[i - 2] + (i + 3) / 2)
    return my_tri
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[3] = (1.;3.;2.0;8.0)];
    .qython.assert[candidate[4] = (1.;3.;2.0;8.0;3.0)];
    .qython.assert[candidate[5] = (1.;3.;2.0;8.0;3.0;15.0)];
    .qython.assert[candidate[6] = (1.;3.;2.0;8.0;3.0;15.0;4.0)];
    .qython.assert[candidate[7] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0)];
    .qython.assert[candidate[8] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0;5.0)];
    .qython.assert[candidate[9] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0;5.0;35.0)];
    .qython.assert[candidate[20] = (1.;3.;2.0;8.0;3.0;15.0;4.0;24.0;5.0;35.0;6.0;48.0;7.0;63.0;8.0;80.0;9.0;99.0;10.0;120.0;11.0)];
    .qython.assert[candidate[0] = enlist 1.];
    .qython.assert[candidate[1] = (1.;3.)]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:130 -->
================================================================================

<!-- PROBLEM_START:131 -->
# Problem 131

<!-- META_START -->
**Task ID:** HumanEval/131
**Entry Point:** digits
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def digits(n):
    """Given a positive integer n, return the product of the odd digits.
    Return 0 if all digits are even.
    For example:
    digits(1)  == 1
    digits(4)  == 0
    digits(235) == 15
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
product = 1
    odd_count = 0
    for digit in str(n):
        int_digit = int(digit)
        if int_digit%2 == 1:
            product= product*int_digit
            odd_count+=1
    if odd_count ==0:
        return 0
    else:
        return product
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5] = 5];
    .qython.assert[candidate[54] = 5];
    .qython.assert[candidate[120] = 1];
    .qython.assert[candidate[5014] = 5];
    .qython.assert[candidate[98765] = 315];
    .qython.assert[candidate[5576543] = 2625];
    .qython.assert[candidate[2468] = 0]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:131 -->
================================================================================

<!-- PROBLEM_START:132 -->
# Problem 132

<!-- META_START -->
**Task ID:** HumanEval/132
**Entry Point:** is_nested
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_nested(string):
    '''
    Create a function that takes a string as input which contains only square brackets.
    The function should return True if and only if there is a valid subsequence of brackets 
    where at least one bracket in the subsequence is nested.

    is_nested('[[]]') ➞ True
    is_nested('[]]]]]]][[[[[]') ➞ False
    is_nested('[][]') ➞ False
    is_nested('[]') ➞ False
    is_nested('[[][]]') ➞ True
    is_nested('[[]][[') ➞ True
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
opening_bracket_index = []
    closing_bracket_index = []
    for i in range(len(string)):
        if string[i] == '[':
            opening_bracket_index.append(i)
        else:
            closing_bracket_index.append(i)
    closing_bracket_index.reverse()
    cnt = 0
    i = 0
    l = len(closing_bracket_index)
    for idx in opening_bracket_index:
        if i < l and idx < closing_bracket_index[i]:
            cnt += 1
            i += 1
    return cnt >= 2
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["[[]]"] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate["[]]]]]]][[[[[]"] = 0b];
    .qython.assert[candidate["[][]"] = 0b];
    .qython.assert[candidate["[]"] = 0b];
    .qython.assert[candidate["[[[[]]]]"] = 1b];
    .qython.assert[candidate["[]]]]]]]]]]"] = 0b];
    .qython.assert[candidate["[][][[]]"] = 1b];
    .qython.assert[candidate["[[]"] = 0b];
    .qython.assert[candidate["[]]"] = 0b];
    .qython.assert[candidate["[[]][["] = 1b];
    .qython.assert[candidate["[[][]]"] = 1b];
    .qython.assert2[candidate[""] = 0b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate["[[[[[[[["] = 0b];
    .qython.assert[candidate["]]]]]]]]"] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:132 -->
================================================================================

<!-- PROBLEM_START:133 -->
# Problem 133

<!-- META_START -->
**Task ID:** HumanEval/133
**Entry Point:** sum_squares
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sum_squares(lst):
    """You are given a list of numbers.
    You need to return the sum of squared numbers in the given list,
    round each element in the list to the upper int(Ceiling) first.
    Examples:
    For lst = [1,2,3] the output should be 14
    For lst = [1,4,9] the output should be 98
    For lst = [1,3,5,7] the output should be 84
    For lst = [1.4,4.2,0] the output should be 29
    For lst = [-2.4,1,1] the output should be 6
    

    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import math
    squared = 0
    for i in lst:
        squared += math.ceil(i)**2
    return squared
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[(1;2;3)] = 14;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(1.0;2;3)] = 14;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(1;3;5;7)] = 84;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(1.4;4.2;0)] = 29;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(-2.4;1;1)] = 6;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(100;1;15;2)] = 10230;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(10000;10000)] = 200000000;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(-1.4;4.6;6.3)] = 75;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(-1.4;17.9;18.9;19.9)] = 1086;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[(candidate[enlist 0]) = 0;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[(candidate[enlist -1]) = 1;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[(-1;1;0)] = 2;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:133 -->
================================================================================

<!-- PROBLEM_START:134 -->
# Problem 134

<!-- META_START -->
**Task ID:** HumanEval/134
**Entry Point:** check_if_last_char_is_a_letter
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def check_if_last_char_is_a_letter(txt):
    '''
    Create a function that returns True if the last character
    of a given string is an alphabetical character and is not
    a part of a word, and False otherwise.
    Note: "word" is a group of characters separated by space.

    Examples:
    check_if_last_char_is_a_letter("apple pie") ➞ False
    check_if_last_char_is_a_letter("apple pi e") ➞ True
    check_if_last_char_is_a_letter("apple pi e ") ➞ False
    check_if_last_char_is_a_letter("") ➞ False 
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
check = txt.split(' ')[-1]
    return True if len(check) == 1 and (97 <= ord(check.lower()) <= 122) else False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["apple"] = 0b];
    .qython.assert[(candidate["apple pi e"]) = 1b];
    .qython.assert[candidate["eeeee"] = 0b];
    .qython.assert[candidate[enlist["A"]] = 1b];
    .qython.assert[(candidate["Pumpkin pie "]) = 0b];
    .qython.assert[(candidate["Pumpkin pie 1"]) = 0b];
    .qython.assert[candidate[""] = 0b];
    .qython.assert[(candidate["eeeee e "]) = 0b];
    .qython.assert[(candidate["apple pie"]) = 0b];
    .qython.assert[(candidate["apple pi e "]) = 0b];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:134 -->
================================================================================

<!-- PROBLEM_START:135 -->
# Problem 135

<!-- META_START -->
**Task ID:** HumanEval/135
**Entry Point:** can_arrange
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def can_arrange(arr):
    """Create a function which Return the largest index i where arr[i] < arr[i-1], or -1 if no such index exists.
    The given array will not contain duplicate values.

    Examples:
    can_arrange([1,2,4,3,5]) = 3
    can_arrange([1,2,3]) = -1
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
ind=-1
    i=1
    while i<len(arr):
      if arr[i]<arr[i-1]:
        ind=i
      i+=1
    return ind
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;4;3;5)] = 3];
    .qython.assert[candidate[(1;2;4;5)] = -1];
    .qython.assert[candidate[(1;4;2;5;6;7;8;9;10)] = 2];
    .qython.assert[candidate[(4;8;5;7;3)] = 4];
    .qython.assert[candidate[()] = -1]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:135 -->
================================================================================

<!-- PROBLEM_START:136 -->
# Problem 136

<!-- META_START -->
**Task ID:** HumanEval/136
**Entry Point:** largest_smallest_integers
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def largest_smallest_integers(lst):
    '''
    Create a function that returns a tuple (a, b), where 'a' is
    the largest (closest to zero) of negative integers, and 'b' is the smallest
    of positive integers in a list.
    If there is no negative or positive integers, return them as None.

    Examples:
    largest_smallest_integers([2, 4, 1, 3, 5, 7]) == (None, 1)
    largest_smallest_integers([]) == (None, None)
    largest_smallest_integers([0]) == (None, None)
    largest_smallest_integers([-6, -4, -4, -3, -100, 1]) == (-3, 1)
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
smallest = list(filter(lambda x: x < 0, lst))
    largest = list(filter(lambda x: x > 0, lst))
    return (max(smallest) if smallest else None, min(largest) if largest else None)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(2;4;1;3;5;7)] = ((::);1)];
    .qython.assert[candidate[(2;4;1;3;5;7;0)] = ((::);1)];
    .qython.assert[candidate[(1;3;2;4;5;6;-2)] = (-2;1)];
    .qython.assert[candidate[(4;5;3;6;2;7;-7)] = (-7;2)];
    .qython.assert[candidate[(7;3;8;4;9;2;5;-9)] = (-9;2)];
    .qython.assert[candidate[()] = ((::);(::))];
    .qython.assert[(candidate[enlist 0]) = ((::);(::))];
    .qython.assert[candidate[(-1;-3;-5;-6)] = (-1;(::))];
    .qython.assert[candidate[(-1;-3;-5;-6;0)] = (-1;(::))];
    .qython.assert[candidate[(-6;-4;-4;-3;1)] = (-3;1)];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:136 -->
================================================================================

<!-- PROBLEM_START:137 -->
# Problem 137

<!-- META_START -->
**Task ID:** HumanEval/137
**Entry Point:** compare_one
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def compare_one(a, b):
    """
    Create a function that takes integers, floats, or strings representing
    real numbers, and returns the larger variable in its given variable type.
    Return None if the values are equal.
    Note: If a real number is represented as a string, the floating point might be . or ,

    compare_one(1, 2.5) ➞ 2.5
    compare_one(1, "2,3") ➞ "2,3"
    compare_one("5,1", "6") ➞ "6"
    compare_one("1", 1) ➞ None
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
temp_a, temp_b = a, b
    if isinstance(temp_a, str): temp_a = temp_a.replace(',','.')
    if isinstance(temp_b, str): temp_b = temp_b.replace(',','.')
    if float(temp_a) == float(temp_b): return None
    return a if float(temp_a) > float(temp_b) else b
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[1;2] = 2];
    .qython.assert[candidate[1;2.5] = 2.5];
    .qython.assert[candidate[2;3] = 3];
    .qython.assert[candidate[5;6] = 6];
    .qython.assert[candidate[1;"2,3"] = "2,3"];
    .qython.assert[candidate["5,1";enlist["6"]] = enlist["6"]];
    .qython.assert[candidate[enlist["1"];enlist["2"]] = enlist["2"]];
    .qython.assert[candidate[enlist["1"];1] = (::)];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:137 -->
================================================================================

<!-- PROBLEM_START:138 -->
# Problem 138

<!-- META_START -->
**Task ID:** HumanEval/138
**Entry Point:** is_equal_to_sum_even
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def is_equal_to_sum_even(n):
    """Evaluate whether the given number n can be written as the sum of exactly 4 positive even numbers
    Example
    is_equal_to_sum_even(4) == False
    is_equal_to_sum_even(6) == False
    is_equal_to_sum_even(8) == True
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return n%2 == 0 and n >= 8
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[4] = 0b];
    .qython.assert[candidate[6] = 0b];
    .qython.assert[candidate[8] = 1b];
    .qython.assert[candidate[10] = 1b];
    .qython.assert[candidate[11] = 0b];
    .qython.assert[candidate[12] = 1b];
    .qython.assert[candidate[13] = 0b];
    .qython.assert[candidate[16] = 1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:138 -->
================================================================================

<!-- PROBLEM_START:139 -->
# Problem 139

<!-- META_START -->
**Task ID:** HumanEval/139
**Entry Point:** special_factorial
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def special_factorial(n):
    """The Brazilian factorial is defined as:
    brazilian_factorial(n) = n! * (n-1)! * (n-2)! * ... * 1!
    where n > 0

    For example:
    >>> special_factorial(4)
    288

    The function will receive an integer as input and should return the special
    factorial of this integer.
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
fact_i = 1
    special_fact = 1
    for i in range(1, n+1):
        fact_i *= i
        special_fact *= fact_i
    return special_fact
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[4] = 288;"Test 4"];
    .qython.assert2[candidate[5] = 34560;"Test 5"];
    .qython.assert2[candidate[7] = 125411328000;"Test 7"];
    .qython.assert2[candidate[1] = 1;"Test 1"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:139 -->
================================================================================

<!-- PROBLEM_START:140 -->
# Problem 140

<!-- META_START -->
**Task ID:** HumanEval/140
**Entry Point:** fix_spaces
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def fix_spaces(text):
    """
    Given a string text, replace all spaces in it with underscores, 
    and if a string has more than 2 consecutive spaces, 
    then replace all consecutive spaces with - 
    
    fix_spaces("Example") == "Example"
    fix_spaces("Example 1") == "Example_1"
    fix_spaces(" Example 2") == "_Example_2"
    fix_spaces(" Example   3") == "_Example-3"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
new_text = ""
    i = 0
    start, end = 0, 0
    while i < len(text):
        if text[i] == " ":
            end += 1
        else:
            if end - start > 2:
                new_text += "-"+text[i]
            elif end - start > 0:
                new_text += "_"*(end - start)+text[i]
            else:
                new_text += text[i]
            start, end = i+1, i+1
        i+=1
    if end - start > 2:
        new_text += "-"
    elif end - start > 0:
        new_text += "_"
    return new_text
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["Example"] = "Example";"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[(candidate["Mudasir Hanif "]) = "Mudasir_Hanif_";"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[(candidate["Yellow Yellow  Dirty  Fellow"]) = "Yellow_Yellow__Dirty__Fellow";"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[(candidate["Exa   mple"]) = "Exa-mple";"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[(candidate["   Exa 1 2 2 mple"]) = "-Exa_1_2_2_mple";"This prints if this assert fails 4 (good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:140 -->
================================================================================

<!-- PROBLEM_START:141 -->
# Problem 141

<!-- META_START -->
**Task ID:** HumanEval/141
**Entry Point:** file_name_check
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def file_name_check(file_name):
    """Create a function which takes a string representing a file's name, and returns
    'Yes' if the the file's name is valid, and returns 'No' otherwise.
    A file's name is considered to be valid if and only if all the following conditions 
    are met:
    - There should not be more than three digits ('0'-'9') in the file's name.
    - The file's name contains exactly one dot '.'
    - The substring before the dot should not be empty, and it starts with a letter from 
    the latin alphapet ('a'-'z' and 'A'-'Z').
    - The substring after the dot should be one of these: ['txt', 'exe', 'dll']
    Examples:
    file_name_check("example.txt") # => 'Yes'
    file_name_check("1example.dll") # => 'No' (the name should start with a latin alphapet letter)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
suf = ['txt', 'exe', 'dll']
    lst = file_name.split(sep='.')
    if len(lst) != 2:
        return 'No'
    if not lst[1] in suf:
        return 'No'
    if len(lst[0]) == 0:
        return 'No'
    if not lst[0][0].isalpha():
        return 'No'
    t = len([x for x in lst[0] if x.isdigit()])
    if t > 3:
        return 'No'
    return 'Yes'
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["example.txt"] = "Yes"];
    .qython.assert[candidate["1example.dll"] = "No"];
    .qython.assert[candidate["s1sdf3.asd"] = "No"];
    .qython.assert[candidate["K.dll"] = "Yes"];
    .qython.assert[candidate["MY16FILE3.exe"] = "Yes"];
    .qython.assert[candidate["His12FILE94.exe"] = "No"];
    .qython.assert[candidate["_Y.txt"] = "No"];
    .qython.assert[candidate["?aREYA.exe"] = "No"];
    .qython.assert[candidate["/this_is_valid.dll"] = "No"];
    .qython.assert[candidate["this_is_valid.wow"] = "No"];
    .qython.assert[candidate["this_is_valid.txt"] = "Yes"];
    .qython.assert[candidate["this_is_valid.txtexe"] = "No"];
    .qython.assert[candidate["#this2_i4s_5valid.ten"] = "No"];
    .qython.assert[candidate["@this1_is6_valid.exe"] = "No"];
    .qython.assert[candidate["this_is_12valid.6exe4.txt"] = "No"];
    .qython.assert[candidate["all.exe.txt"] = "No"];
    .qython.assert[candidate["I563_No.exe"] = "Yes"];
    .qython.assert[candidate["Is3youfault.txt"] = "Yes"];
    .qython.assert[candidate["no_one#knows.dll"] = "Yes"];
    .qython.assert[candidate["1I563_Yes3.exe"] = "No"];
    .qython.assert[candidate["I563_Yes3.txtt"] = "No"];
    .qython.assert[candidate["final..txt"] = "No"];
    .qython.assert[candidate["final132"] = "No"];
    .qython.assert[candidate["_f4indsartal132."] = "No"];
    .qython.assert[candidate[".txt"] = "No"];
    .qython.assert[candidate["s."] = "No"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:141 -->
================================================================================

<!-- PROBLEM_START:142 -->
# Problem 142

<!-- META_START -->
**Task ID:** HumanEval/142
**Entry Point:** sum_squares
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sum_squares(lst):
    """"
    This function will take a list of integers. For all entries in the list, the function shall square the integer entry if its index is a 
    multiple of 3 and will cube the integer entry if its index is a multiple of 4 and not a multiple of 3. The function will not 
    change the entries in the list whose indexes are not a multiple of 3 or 4. The function shall then return the sum of all entries. 
    
    Examples:
    For lst = [1,2,3] the output should be 6
    For lst = []  the output should be 0
    For lst = [-1,-5,2,-1,-5]  the output should be -126
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
result =[]
    for i in range(len(lst)):
        if i %3 == 0:
            result.append(lst[i]**2)
        elif i % 4 == 0 and i%3 != 0:
            result.append(lst[i]**3)
        else:
            result.append(lst[i])
    return sum(result)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;2;3)] = 6];
    .qython.assert[candidate[(1;4;9)] = 14];
    .qython.assert[candidate[()] = 0];
    .qython.assert[candidate[(1;1;1;1;1;1;1;1;1)] = 9];
    .qython.assert[candidate[(-1;-1;-1;-1;-1;-1;-1;-1;-1)] = -3];
    .qython.assert[(candidate[enlist 0]) = 0];
    .qython.assert[candidate[(-1;-5;2;-1;-5)] = -126];
    .qython.assert[candidate[(-56;-99;1;0;-2)] = 3030];
    .qython.assert[candidate[(-1;0;0;0;0;0;0;0;-1)] = 0];
    .qython.assert[candidate[(-16;-9;-2;36;36;26;-20;25;-40;20;-4;12;-26;35;37)] = -14196];
    .qython.assert[candidate[(-1;-3;17;-1;-15;13;-1;14;-14;-12;-5;14;-14;6;13;11;16;16;4;10)] = -1448]
    }    / Don'
```
<!-- TEST_END -->

<!-- PROBLEM_END:142 -->
================================================================================

<!-- PROBLEM_START:143 -->
# Problem 143

<!-- META_START -->
**Task ID:** HumanEval/143
**Entry Point:** words_in_sentence
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def words_in_sentence(sentence):
    """
    You are given a string representing a sentence,
    the sentence contains some words separated by a space,
    and you have to return a string that contains the words from the original sentence,
    whose lengths are prime numbers,
    the order of the words in the new string should be the same as the original one.

    Example 1:
        Input: sentence = "This is a test"
        Output: "is"

    Example 2:
        Input: sentence = "lets go for swimming"
        Output: "go for"

    Constraints:
        * 1 <= len(sentence) <= 100
        * sentence contains only letters
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
new_lst = []
    for word in sentence.split():
        flg = 0
        if len(word) == 1:
            flg = 1
        for i in range(2, len(word)):
            if len(word)%i == 0:
                flg = 1
        if flg == 0 or len(word) == 2:
            new_lst.append(word)
    return " ".join(new_lst)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate["This is a test"]) = "is"];
    .qython.assert[(candidate["lets go for swimming"]) = ("go for")];
    .qython.assert[(candidate["there is no place available here"]) = ("there is no place")];
    .qython.assert[(candidate["Hi I am Hussein"]) = ("Hi am Hussein")];
    .qython.assert[(candidate["go for it"]) = ("go for it")];
    .qython.assert[candidate["here"] = ""];
    .qython.assert[(candidate["here is"]) = "is"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:143 -->
================================================================================

<!-- PROBLEM_START:144 -->
# Problem 144

<!-- META_START -->
**Task ID:** HumanEval/144
**Entry Point:** simplify
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def simplify(x, n):
    """Your task is to implement a function that will simplify the expression
    x * n. The function returns True if x * n evaluates to a whole number and False
    otherwise. Both x and n, are string representation of a fraction, and have the following format,
    <numerator>/<denominator> where both numerator and denominator are positive whole numbers.

    You can assume that x, and n are valid fractions, and do not have zero as denominator.

    simplify("1/5", "5/1") = True
    simplify("1/6", "2/1") = False
    simplify("7/10", "10/2") = False
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
a, b = x.split("/")
    c, d = n.split("/")
    numerator = int(a) * int(c)
    denom = int(b) * int(d)
    if (numerator/denom == int(numerator/denom)):
        return True
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["1/5";"5/1"] = 1b;"test1"];
    .qython.assert2[candidate["1/6";"2/1"] = 0b;"test2"];
    .qython.assert2[candidate["5/1";"3/1"] = 1b;"test3"];
    .qython.assert2[candidate["7/10";"10/2"] = 0b;"test4"];
    .qython.assert2[candidate["2/10";"50/10"] = 1b;"test5"];
    .qython.assert2[candidate["7/2";"4/2"] = 1b;"test6"];
    .qython.assert2[candidate["11/6";"6/1"] = 1b;"test7"];
    .qython.assert2[candidate["2/3";"5/2"] = 0b;"test8"];
    .qython.assert2[candidate["5/2";"3/5"] = 0b;"test9"];
    .qython.assert2[candidate["2/4";"8/4"] = 1b;"test10"];
    .qython.assert2[candidate["2/4";"4/2"] = 1b;"test11"];
    .qython.assert2[candidate["1/5";"5/1"] = 1b;"test12"];
    .qython.assert2[candidate["1/5";"1/5"] = 0b;"test13"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:144 -->
================================================================================

<!-- PROBLEM_START:145 -->
# Problem 145

<!-- META_START -->
**Task ID:** HumanEval/145
**Entry Point:** order_by_points
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def order_by_points(nums):
    """
    Write a function which sorts the given list of integers
    in ascending order according to the sum of their digits.
    Note: if there are several items with similar sum of their digits,
    order them based on their index in original list.
    For negative numbers, the first digit is negative and remaining digits are positive when calculating the sum.

    For example:
    >>> order_by_points([1, 11, -1, -11, -12]) == [-1, -11, 1, -12, 11]
    >>> order_by_points([]) == []
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
def digits_sum(n):
        neg = 1
        if n < 0: n, neg = -1 * n, -1 
        n = [int(i) for i in str(n)]
        n[0] = n[0] * neg
        return sum(n)
    return sorted(nums, key=digits_sum)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(1;11;-1;-11;-12)] = (-1;-11;1;-12;11)];
    .qython.assert[candidate[(1234;423;463;145;2;423;423;53;6;37;3457;3;56;0;46)] = (0;2;3;6;53;423;423;423;1234;145;37;46;56;463;3457)];
    .qython.assert[candidate[()] = ()];
    .qython.assert[candidate[(1;-11;-32;43;54;-98;2;-3)] = (-3;-32;-98;-11;1;2;43;54)];
    .qython.assert[candidate[(1;2;3;4;5;6;7;8;9;10;11)] = (1;10;2;11;3;4;5;6;7;8;9)];
    .qython.assert[candidate[(0;6;6;-76;-21;23;4)] = (-76;-21;0;4;23;6;6)];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:145 -->
================================================================================

<!-- PROBLEM_START:146 -->
# Problem 146

<!-- META_START -->
**Task ID:** HumanEval/146
**Entry Point:** specialFilter
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def specialFilter(nums):
    """Write a function that takes an array of numbers as input and returns 
    the number of elements in the array that are greater than 10 and both 
    first and last digits of a number are odd (1, 3, 5, 7, 9).
    For example:
    specialFilter([15, -73, 14, -15]) => 1 
    specialFilter([33, -2, -3, 45, 21, 109]) => 2
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
count = 0
    for num in nums:
        if num > 10:
            odd_digits = (1, 3, 5, 7, 9)
            number_as_string = str(num)
            if int(number_as_string[0]) in odd_digits and int(number_as_string[-1]) in odd_digits:
                count += 1
        
    return count
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[(5;-2;1;-5)] = 0];
    .qython.assert[candidate[(15;-73;14;-15)] = 1];
    .qython.assert[candidate[(33;-2;-3;45;21;109)] = 2];
    .qython.assert[candidate[(43;-12;93;125;121;109)] = 4];
    .qython.assert[candidate[(71;-2;-33;75;21;19)] = 3];
    .qython.assert[(candidate[enlist 1]) = 0];
    .qython.assert[candidate[()] = 0]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:146 -->
================================================================================

<!-- PROBLEM_START:147 -->
# Problem 147

<!-- META_START -->
**Task ID:** HumanEval/147
**Entry Point:** get_max_triples
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def get_max_triples(n):
    """
    You are given a positive integer n. You have to create an integer array a of length n.
        For each i (1 ≤ i ≤ n), the value of a[i] = i * i - i + 1.
        Return the number of triples (a[i], a[j], a[k]) of a where i < j < k, 
    and a[i] + a[j] + a[k] is a multiple of 3.

    Example :
        Input: n = 5
        Output: 1
        Explanation: 
        a = [1, 3, 7, 13, 21]
        The only valid triple is (1, 7, 13).
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
A = [i*i - i + 1 for i in range(1,n+1)]
    ans = []
    for i in range(n):
        for j in range(i+1,n):
            for k in range(j+1,n):
                if (A[i]+A[j]+A[k])%3 == 0:
                    ans += [(A[i],A[j],A[k])]
    return len(ans)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[5] = 1];
    .qython.assert[candidate[6] = 4];
    .qython.assert[candidate[10] = 36];
    .qython.assert[candidate[100] = 53361]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:147 -->
================================================================================

<!-- PROBLEM_START:148 -->
# Problem 148

<!-- META_START -->
**Task ID:** HumanEval/148
**Entry Point:** bf
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def bf(planet1, planet2):
    '''
    There are eight planets in our solar system: the closerst to the Sun 
    is Mercury, the next one is Venus, then Earth, Mars, Jupiter, Saturn, 
    Uranus, Neptune.
    Write a function that takes two planet names as strings planet1 and planet2. 
    The function should return a tuple containing all planets whose orbits are 
    located between the orbit of planet1 and the orbit of planet2, sorted by 
    the proximity to the sun. 
    The function should return an empty tuple if planet1 or planet2
    are not correct planet names. 
    Examples
    bf("Jupiter", "Neptune") ==> ("Saturn", "Uranus")
    bf("Earth", "Mercury") ==> ("Venus")
    bf("Mercury", "Uranus") ==> ("Venus", "Earth", "Mars", "Jupiter", "Saturn")
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
planet_names = ("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
    if planet1 not in planet_names or planet2 not in planet_names or planet1 == planet2:
        return ()
    planet1_index = planet_names.index(planet1)
    planet2_index = planet_names.index(planet2)
    if planet1_index < planet2_index:
        return (planet_names[planet1_index + 1: planet2_index])
    else:
        return (planet_names[planet2_index + 1 : planet1_index])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["Jupiter";"Neptune"] = ("Saturn";"Uranus");raze[("First test error: ";.qython.String[count[candidate["Jupiter";"Neptune"]]])]];
    .qython.assert2[candidate["Earth";"Mercury"] = enlist "Venus";raze[("Second test error: ";.qython.String[candidate["Earth";"Mercury"]])]];
    .qython.assert2[candidate["Mercury";"Uranus"] = ("Venus";"Earth";"Mars";"Jupiter";"Saturn");raze[("Third test error: ";.qython.String[candidate["Mercury";"Uranus"]])]];
    .qython.assert2[candidate["Neptune";"Venus"] = ("Earth";"Mars";"Jupiter";"Saturn";"Uranus");raze[("Fourth test error: ";.qython.String[candidate["Neptune";"Venus"]])]];
    .qython.assert[candidate["Earth";"Earth"] = ()];
    .qython.assert[candidate["Mars";"Earth"] = ()];
    .qython.assert[candidate["Jupiter";"Makemake"] = ()]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:148 -->
================================================================================

<!-- PROBLEM_START:149 -->
# Problem 149

<!-- META_START -->
**Task ID:** HumanEval/149
**Entry Point:** sorted_list_sum
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def sorted_list_sum(lst):
    """Write a function that accepts a list of strings as a parameter,
    deletes the strings that have odd lengths from it,
    and returns the resulted list with a sorted order,
    The list is always a list of strings and never an array of numbers,
    and it may contain duplicates.
    The order of the list should be ascending by length of each word, and you
    should return the list sorted by that rule.
    If two words have the same length, sort the list alphabetically.
    The function should return a list of strings in sorted order.
    You may assume that all words will have the same length.
    For example:
    assert list_sort(["aa", "a", "aaa"]) => ["aa"]
    assert list_sort(["ab", "a", "aaa", "cd"]) => ["ab", "cd"]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
lst.sort()
    new_lst = []
    for i in lst:
        if len(i)%2 == 0:
            new_lst.append(i)
    return sorted(new_lst, key=len)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[("aa";enlist["a"];"aaa")] = enlist "aa"];
    .qython.assert[candidate[("school";"AI";"asdf";enlist["b"])] = ("AI";"asdf";"school")];
    .qython.assert[candidate[(enlist["d"];enlist["b"];enlist["c"];enlist["a"])] = ()];
    .qython.assert[candidate[(enlist["d"];"dcba";"abcd";enlist["a"])] = ("abcd";"dcba")];
    .qython.assert[candidate[("AI";"ai";"au")] = ("AI";"ai";"au")];
    .qython.assert[candidate[(enlist["a"];enlist["b"];enlist["b"];enlist["c"];enlist["c"];enlist["a"])] = ()];
    .qython.assert[candidate[("aaaa";"bbbb";"dd";"cc")] = ("cc";"dd";"aaaa";"bbbb")]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:149 -->
================================================================================

<!-- PROBLEM_START:150 -->
# Problem 150

<!-- META_START -->
**Task ID:** HumanEval/150
**Entry Point:** x_or_y
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def x_or_y(n, x, y):
    """A simple program which should return the value of x if n is 
    a prime number and should return the value of y otherwise.

    Examples:
    for x_or_y(7, 34, 12) == 34
    for x_or_y(15, 8, 5) == 5
    
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if n == 1:
        return y
    for i in range(2, n):
        if n % i == 0:
            return y
            break
    else:
        return x
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[7;34;12] = 34];
    .qython.assert[candidate[15;8;5] = 5];
    .qython.assert[candidate[3;33;5212] = 33];
    .qython.assert[candidate[1259;3;52] = 3];
    .qython.assert[candidate[7919;-1;12] = -1];
    .qython.assert[candidate[3609;1245;583] = 583];
    .qython.assert[candidate[91;56;129] = 129];
    .qython.assert[candidate[6;34;1234] = 1234];
    .qython.assert[candidate[1;2;0] = 0];
    .qython.assert[candidate[2;2;0] = 2]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:150 -->
================================================================================

<!-- PROBLEM_START:151 -->
# Problem 151

<!-- META_START -->
**Task ID:** HumanEval/151
**Entry Point:** double_the_difference
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def double_the_difference(lst):
    '''
    Given a list of numbers, return the sum of squares of the numbers
    in the list that are odd. Ignore numbers that are negative or not integers.
    
    double_the_difference([1, 3, 2, 0]) == 1 + 9 + 0 + 0 = 10
    double_the_difference([-1, -2, 0]) == 0
    double_the_difference([9, -2]) == 81
    double_the_difference([0]) == 0  
   
    If the input list is empty, return 0.
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sum([i**2 for i in lst if i > 0 and i%2!=0 and "." not in str(i)])
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[()] = 0;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(5;4)] = 25;"This prints if this assert fails 2 (good for debugging!)"];
    .qython.assert2[candidate[(0.1;0.2;0.3)] = 0;"This prints if this assert fails 3 (good for debugging!)"];
    .qython.assert2[candidate[(-10;-20;-30)] = 0;"This prints if this assert fails 4 (good for debugging!)"];
    .qython.assert2[candidate[(-1;-2;8)] = 0;"This prints if this assert fails 5 (also good for debugging!)"];
    .qython.assert2[candidate[(0.2;3;5)] = 34;"This prints if this assert fails 6 (also good for debugging!)"];
    lst:.qython.arange[-99;100;2];
    odd_sum:sum[{[i] i xexp 2} each lst where {[i] ((i mod 2) <> 0) and i > 0} each lst];
    .qython.assert2[candidate[lst] = odd_sum;"This prints if this assert fails 7 (good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:151 -->
================================================================================

<!-- PROBLEM_START:152 -->
# Problem 152

<!-- META_START -->
**Task ID:** HumanEval/152
**Entry Point:** compare
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def compare(game,guess):
    """I think we all remember that feeling when the result of some long-awaited
    event is finally known. The feelings and thoughts you have at that moment are
    definitely worth noting down and comparing.
    Your task is to determine if a person correctly guessed the results of a number of matches.
    You are given two arrays of scores and guesses of equal length, where each index shows a match. 
    Return an array of the same length denoting how far off each guess was. If they have guessed correctly,
    the value is 0, and if not, the value is the absolute difference between the guess and the score.
    
    
    example:

    compare([1,2,3,4,5,1],[1,2,3,4,2,-2]) -> [0,0,0,0,3,3]
    compare([0,5,0,0,0,4],[4,1,1,0,0,-2]) -> [4,4,1,0,0,6]
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return [abs(x-y) for x,y in zip(game,guess)]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[(1;2;3;4;5;1);(1;2;3;4;2;-2)] = (0;0;0;0;3;3);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(0;0;0;0;0;0);(0;0;0;0;0;0)] = (0;0;0;0;0;0);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;3);(-1;-2;-3)] = (2;4;6);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[(1;2;3;5);(-1;2;3;4)] = (2;0;0;1);"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:152 -->
================================================================================

<!-- PROBLEM_START:153 -->
# Problem 153

<!-- META_START -->
**Task ID:** HumanEval/153
**Entry Point:** Strongest_Extension
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def Strongest_Extension(class_name, extensions):
    """You will be given the name of a class (a string) and a list of extensions.
    The extensions are to be used to load additional classes to the class. The
    strength of the extension is as follows: Let CAP be the number of the uppercase
    letters in the extension's name, and let SM be the number of lowercase letters 
    in the extension's name, the strength is given by the fraction CAP - SM. 
    You should find the strongest extension and return a string in this 
    format: ClassName.StrongestExtensionName.
    If there are two or more extensions with the same strength, you should
    choose the one that comes first in the list.
    For example, if you are given "Slices" as the class and a list of the
    extensions: ['SErviNGSliCes', 'Cheese', 'StuFfed'] then you should
    return 'Slices.SErviNGSliCes' since 'SErviNGSliCes' is the strongest extension 
    (its strength is -1).
    Example:
    for Strongest_Extension('my_class', ['AA', 'Be', 'CC']) == 'my_class.AA'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
strong = extensions[0]
    my_val = len([x for x in extensions[0] if x.isalpha() and x.isupper()]) - len([x for x in extensions[0] if x.isalpha() and x.islower()])
    for s in extensions:
        val = len([x for x in s if x.isalpha() and x.isupper()]) - len([x for x in s if x.isalpha() and x.islower()])
        if val > my_val:
            strong = s
            my_val = val

    ans = class_name + "." + strong
    return ans
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["Watashi";("tEN";"niNE";"eIGHt8OKe")] = "Watashi.eIGHt8OKe"];
    .qython.assert[candidate["Boku123";("nani";"NazeDa";"YEs.WeCaNe";"32145tggg")] = "Boku123.YEs.WeCaNe"];
    .qython.assert[candidate["__YESIMHERE";(enlist["t"];"eMptY";"nothing";"zeR00";"NuLl__";"123NoooneB321")] = "__YESIMHERE.NuLl__"];
    .qython.assert[candidate[enlist["K"];("Ta";"TAR";"t234An";"cosSo")] = "K.TAR"];
    .qython.assert[candidate["__HAHA";("Tab";"123";"781345";"-_-")] = "__HAHA.123"];
    .qython.assert[candidate["YameRore";("HhAas";"okIWILL123";"WorkOut";"Fails";"-_-")] = "YameRore.okIWILL123"];
    .qython.assert[candidate["finNNalLLly";("Die";"NowW";"Wow";"WoW")] = "finNNalLLly.WoW"];
    .qython.assert[candidate[enlist["_"];("Bb";"91245")] = "_.Bb"];
    .qython.assert[candidate["Sp";("671235";"Bb")] = "Sp.671235"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:153 -->
================================================================================

<!-- PROBLEM_START:154 -->
# Problem 154

<!-- META_START -->
**Task ID:** HumanEval/154
**Entry Point:** cycpattern_check
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def cycpattern_check(a , b):
    """You are given 2 words. You need to return True if the second word or any of its rotations is a substring in the first word
    cycpattern_check("abcd","abd") => False
    cycpattern_check("hello","ell") => True
    cycpattern_check("whassup","psus") => False
    cycpattern_check("abab","baa") => True
    cycpattern_check("efef","eeff") => False
    cycpattern_check("himenss","simen") => True

    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
l = len(b)
    pat = b + b
    for i in range(len(a) - l + 1):
        for j in range(l + 1):
            if a[i:i+l] == pat[j:j+l]:
                return True
    return False
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate["xyzw";"xyw"] = 0b;"test #0"];
    .qython.assert2[candidate["yello";"ell"] = 1b;"test #1"];
    .qython.assert2[candidate["whattup";"ptut"] = 0b;"test #2"];
    .qython.assert2[candidate["efef";"fee"] = 1b;"test #3"];
    .qython.assert2[candidate["abab";"aabb"] = 0b;"test #4"];
    .qython.assert2[candidate["winemtt";"tinem"] = 1b;"test #5"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:154 -->
================================================================================

<!-- PROBLEM_START:155 -->
# Problem 155

<!-- META_START -->
**Task ID:** HumanEval/155
**Entry Point:** even_odd_count
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def even_odd_count(num):
    """Given an integer. return a tuple that has the number of even and odd digits respectively.

     Example:
        even_odd_count(-12) ==> (1, 1)
        even_odd_count(123) ==> (1, 2)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
even_count = 0
    odd_count = 0
    for i in str(abs(num)):
        if int(i)%2==0:
            even_count +=1
        else:
            odd_count +=1
    return (even_count, odd_count)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[7] = (0;1)];
    .qython.assert[candidate[-78] = (1;1)];
    .qython.assert[candidate[3452] = (2;2)];
    .qython.assert[candidate[346211] = (3;3)];
    .qython.assert[candidate[-345821] = (3;3)];
    .qython.assert[candidate[-2] = (1;0)];
    .qython.assert[candidate[-45347] = (2;3)];
    .qython.assert[candidate[0] = (1;0)];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:155 -->
================================================================================

<!-- PROBLEM_START:156 -->
# Problem 156

<!-- META_START -->
**Task ID:** HumanEval/156
**Entry Point:** int_to_mini_roman
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def int_to_mini_roman(number):
    """
    Given a positive integer, obtain its roman numeral equivalent as a string,
    and return it in lowercase.
    Restrictions: 1 <= num <= 1000

    Examples:
    >>> int_to_mini_roman(19) == 'xix'
    >>> int_to_mini_roman(152) == 'clii'
    >>> int_to_mini_roman(426) == 'cdxxvi'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
num = [1, 4, 5, 9, 10, 40, 50, 90,  
           100, 400, 500, 900, 1000] 
    sym = ["I", "IV", "V", "IX", "X", "XL",  
           "L", "XC", "C", "CD", "D", "CM", "M"] 
    i = 12
    res = ''
    while number: 
        div = number // num[i] 
        number %= num[i] 
        while div: 
            res += sym[i] 
            div -= 1
        i -= 1
    return res.lower()
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[19] = "xix"];
    .qython.assert[candidate[152] = "clii"];
    .qython.assert[candidate[251] = "ccli"];
    .qython.assert[candidate[426] = "cdxxvi"];
    .qython.assert[candidate[500] = enlist["d"]];
    .qython.assert[candidate[1] = enlist["i"]];
    .qython.assert[candidate[4] = "iv"];
    .qython.assert[candidate[43] = "xliii"];
    .qython.assert[candidate[90] = "xc"];
    .qython.assert[candidate[94] = "xciv"];
    .qython.assert[candidate[532] = "dxxxii"];
    .qython.assert[candidate[900] = "cm"];
    .qython.assert[candidate[994] = "cmxciv"];
    .qython.assert[candidate[1000] = enlist["m"]];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:156 -->
================================================================================

<!-- PROBLEM_START:157 -->
# Problem 157

<!-- META_START -->
**Task ID:** HumanEval/157
**Entry Point:** right_angle_triangle
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def right_angle_triangle(a, b, c):
    '''
    Given the lengths of the three sides of a triangle. Return True if the three
    sides form a right-angled triangle, False otherwise.
    A right-angled triangle is a triangle in which one angle is right angle or 
    90 degree.
    Example:
    right_angle_triangle(3, 4, 5) == True
    right_angle_triangle(1, 2, 3) == False
    '''
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return a*a == b*b + c*c or b*b == a*a + c*c or c*c == a*a + b*b
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[3;4;5] = 1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert[candidate[1;2;3] = 0b];
    .qython.assert[candidate[10;6;8] = 1b];
    .qython.assert[candidate[2;2;2] = 0b];
    .qython.assert[candidate[7;24;25] = 1b];
    .qython.assert[candidate[10;5;7] = 0b];
    .qython.assert[candidate[5;12;13] = 1b];
    .qython.assert[candidate[15;8;17] = 1b];
    .qython.assert[candidate[48;55;73] = 1b];
    .qython.assert2[candidate[1;1;1] = 0b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert[candidate[2;2;10] = 0b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:157 -->
================================================================================

<!-- PROBLEM_START:158 -->
# Problem 158

<!-- META_START -->
**Task ID:** HumanEval/158
**Entry Point:** find_max
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def find_max(words):
    """Write a function that accepts a list of strings.
    The list contains different words. Return the word with maximum number
    of unique characters. If multiple strings have maximum number of unique
    characters, return the one which comes first in lexicographical order.

    find_max(["name", "of", "string"]) == "string"
    find_max(["name", "enam", "game"]) == "enam"
    find_max(["aaaaaaa", "bb" ,"cc"]) == ""aaaaaaa"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
return sorted(words, key = lambda x: (-len(set(x)), x))[0]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[("name";"of";"string")] = "string";"t1"];
    .qython.assert2[candidate[("name";"enam";"game")] = "enam";"t2"];
    .qython.assert2[candidate[("aaaaaaa";"bb";"cc")] = "aaaaaaa";"t3"];
    .qython.assert2[candidate[("abc";"cba")] = "abc";"t4"];
    .qython.assert2[candidate[("play";"this";"game";"of";"footbott")] = "footbott";"t5"];
    .qython.assert2[candidate[("we";"are";"gonna";"rock")] = "gonna";"t6"];
    .qython.assert2[candidate[("we";"are";enlist["a"];"mad";"nation")] = "nation";"t7"];
    .qython.assert2[candidate[("this";"is";enlist["a"];"prrk")] = "this";"t8"];
    .qython.assert2[(candidate[enlist enlist["b"]]) = enlist["b"];"t9"];
    .qython.assert2[candidate[("play";"play";"play")] = "play";"t10"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:158 -->
================================================================================

<!-- PROBLEM_START:159 -->
# Problem 159

<!-- META_START -->
**Task ID:** HumanEval/159
**Entry Point:** eat
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def eat(number, need, remaining):
    """
    You're a hungry rabbit, and you already have eaten a certain number of carrots,
    but now you need to eat more carrots to complete the day's meals.
    you should return an array of [ total number of eaten carrots after your meals,
                                    the number of carrots left after your meals ]
    if there are not enough remaining carrots, you will eat all remaining carrots, but will still be hungry.
    
    Example:
    * eat(5, 6, 10) -> [11, 4]
    * eat(4, 8, 9) -> [12, 1]
    * eat(1, 10, 10) -> [11, 0]
    * eat(2, 11, 5) -> [7, 0]
    
    Variables:
    @number : integer
        the number of carrots that you have eaten.
    @need : integer
        the additional number of carrots you must eat to complete the day's meals
    @remaining : integer
        the number of remaining carrots thet exist in stock
    
    Constrain:
    * 0 <= number <= 1000
    * 0 <= need <= 1000
    * 0 <= remaining <= 1000

    Have fun :)
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
if(need <= remaining):
        return [ number + need , remaining-need ]
    else:
        return [ number + remaining , 0]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[1b;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[candidate[5;6;10] = (11;4);"Error"];
    .qython.assert2[candidate[4;8;9] = (12;1);"Error"];
    .qython.assert2[candidate[1;10;10] = (11;0);"Error"];
    .qython.assert2[candidate[2;11;5] = (7;0);"Error"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"];
    .qython.assert2[candidate[4;5;7] = (9;2);"Error"];
    .qython.assert2[candidate[4;5;1] = (5;0);"Error"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:159 -->
================================================================================

<!-- PROBLEM_START:160 -->
# Problem 160

<!-- META_START -->
**Task ID:** HumanEval/160
**Entry Point:** do_algebra
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def do_algebra(operator, operand):
    """
    Given two lists operator, and operand. The first list has basic algebra operations, and 
    the second list is a list of integers. Use the two given lists to build the algebric 
    expression and return the evaluation of this expression.

    The basic algebra operations:
    Addition ( + ) 
    Subtraction ( - ) 
    Multiplication ( * ) 
    Floor division ( // ) 
    Exponentiation ( ** ) 

    Example:
    operator['+', '*', '-']
    array = [2, 3, 4, 5]
    result = 2 + 3 * 4 - 5
    => result = 9

    Note:
        The length of operator list is equal to the length of operand list minus one.
        Operand is a list of of non-negative integers.
        Operator list has at least one operator, and operand list has at least two operands.

    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
expression = str(operand[0])
    for oprt, oprn in zip(operator, operand[1:]):
        expression+= oprt + str(oprn)
    return eval(expression)
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate[("**";enlist["*"];enlist["+"]);(2;3;4;5)] = 37];
    .qython.assert[candidate[(enlist["+"];enlist["*"];enlist["-"]);(2;3;4;5)] = 9];
    .qython.assert2[candidate[("//";enlist["*"]);(7;3;4)] = 8;"This prints if this assert fails 1 (good for debugging!)"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:160 -->
================================================================================

<!-- PROBLEM_START:161 -->
# Problem 161

<!-- META_START -->
**Task ID:** HumanEval/161
**Entry Point:** solve
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def solve(s):
    """You are given a string s.
    if s[i] is a letter, reverse its case from lower to upper or viceversa, 
    otherwise keep it as it is.
    If the string contains no letters, reverse the string.
    The function should return the resulted string.
    Examples
    solve("1234") = "4321"
    solve("ab") = "AB"
    solve("#a@C") = "#A@c"
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
flg = 0
    idx = 0
    new_str = list(s)
    for i in s:
        if i.isalpha():
            new_str[idx] = i.swapcase()
            flg = 1
        idx += 1
    s = ""
    for i in new_str:
        s += i
    if flg == 0:
        return s[len(s)::-1]
    return s
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[candidate["AsDf"] = "aSdF"];
    .qython.assert[candidate["1234"] = "4321"];
    .qython.assert[candidate["ab"] = "AB"];
    .qython.assert[candidate["#a@C"] = "#A@c"];
    .qython.assert[candidate["#AsdfW^45"] = "#aSDFw^45"];
    .qython.assert[candidate["#6@2"] = "2@6#"];
    .qython.assert[candidate["#$a^D"] = "#$A^d"];
    .qython.assert[candidate["#ccc"] = "#CCC"]
    }    / Don'
```
<!-- TEST_END -->

<!-- PROBLEM_END:161 -->
================================================================================

<!-- PROBLEM_START:162 -->
# Problem 162

<!-- META_START -->
**Task ID:** HumanEval/162
**Entry Point:** string_to_md5
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def string_to_md5(text):
    """
    Given a string 'text', return its md5 hash equivalent string.
    If 'text' is an empty string, return None.

    >>> string_to_md5('Hello world') == '3e25960a79dbc69b674cd4ec67a72c62'
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
import hashlib
    return hashlib.md5(text.encode('ascii')).hexdigest() if text else None
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert[(candidate["Hello world"]) = "3e25960a79dbc69b674cd4ec67a72c62"];
    .qython.assert[candidate[""] = (::)];
    .qython.assert[(candidate["A B C"]) = "0ef78513b0cb8cef12743f5aeb35f888"];
    .qython.assert[candidate["password"] = "5f4dcc3b5aa765d61d8327deb882cf99"];
    .qython.assert[1b]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:162 -->
================================================================================

<!-- PROBLEM_START:163 -->
# Problem 163

<!-- META_START -->
**Task ID:** HumanEval/163
**Entry Point:** generate_integers
<!-- META_END -->

<!-- PROMPT_START -->
## Problem Statement
```python
def generate_integers(a, b):
    """
    Given two positive integers a and b, return the single-digit even numbers in the
    closed interval [min(a,b), max(a,b)] (including endpoints), in ascending order.

    For example:
    generate_integers(2, 8) => [2, 4, 6, 8]
    generate_integers(8, 2) => [2, 4, 6, 8]
    generate_integers(10, 14) => []
    """
```
<!-- PROMPT_END -->

<!-- SOLUTION_START -->
## Canonical Solution
```python
lower = max(2, min(a, b))
    upper = min(8, max(a, b))

    return [i for i in range(lower, upper+1) if i % 2 == 0]
```
<!-- SOLUTION_END -->

<!-- TEST_START -->
## Test Cases
```q
check:{[candidate]
    .qython.assert2[candidate[2;10] = (2;4;6;8);"Test 1"];
    .qython.assert2[candidate[10;2] = (2;4;6;8);"Test 2"];
    .qython.assert2[candidate[132;2] = (2;4;6;8);"Test 3"];
    .qython.assert2[candidate[17;89] = ();"Test 4"];
    .qython.assert2[1b;"This prints if this assert fails 2 (also good for debugging!)"]
    }
```
<!-- TEST_END -->

<!-- PROBLEM_END:163 -->
================================================================================


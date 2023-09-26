### Conclusions 
1. Recursion is a good way of iterating tree structures
2. Not always using trees for words would be good, sometimes its time complexity is
really big, for long words
3. Dynamic programming is in general using some variable to store results 
during recursion to not calculate the same stuff more than one. So at the cost
of memory we gain faster calculations
4. Longest common subsequence (LCS) is a general problem, which looks for 
the longest common subsequnce in two sequences. To make solution run faster
use dynamic programming (do not calculate more than once the same stuff)
5. Dont focus on words/sequences, but on their length as it was the task (to 
return the length of the longest common child, not the common child itself)
6. Incrementing variable and THEN passing it as a function argument IS NOT
THE SAME as passing variable + 1:
```python
a += 1
fun(a)
```
IS DIFFERENT FROM:
```python
fun(a+1)
```
First example increments variable VALUE and then passes this variable. Second
example passes variable VALUE + 1

### Links
1. https://www.geeksforgeeks.org/longest-common-subsequence-dp-4/
2. https://www.geeksforgeeks.org/dynamic-programming/




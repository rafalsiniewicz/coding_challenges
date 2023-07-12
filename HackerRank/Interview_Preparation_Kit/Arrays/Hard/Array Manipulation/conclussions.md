### Conclusions 
1. Remember about prefix sum in such type of task, where you need to add the same 
value to many array elements.
2. If you have a task which has adding the same to array over some range, then use
the "trick" of "rise/fall edge", e.g. you have to add 4 to array over a range [1,5],
then add 4 to index=1 and substract 4 from the next index, so index=6 
(if index=6 < n, where=len(arr)), so:
```python
arr[1] += 4
arr[6] -= 4
```
3. If task seems simple to solve, then its about time/calculations/memory complexity.
For such task O(n^2) time complexity is too much. Avoid nested loops


### Links
1. https://www.geeksforgeeks.org/prefix-sum-array-implementation-applications-competitive-programming/
2. https://medium.com/@mlgerardvla/hackerrank-array-manipulation-beat-the-clock-using-prefix-sum-92471060035e
3. https://sites.northwestern.edu/acids/2018/11/12/solution-hackerrank-array-manipulation/




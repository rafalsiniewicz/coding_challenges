### Conclusions 
1. PAY ATTENTION TO computational complexity!!! Avoid nested loops. Use 1 loop at max.!!! 2 loops means at least ```O(n^2)``` complexity!!!
2. Dont use nested loops (even if theyre not directly loops, e.g. ```list.index()``` function, ```list.remove()``` function or any other function that still needs to iterate over array)
3. Avoid loops, look for options to find desired index by exploiting number, e.g. if you have to sort list out, then number ```4``` has to be on the index ```3```, so number ```x``` has to be on the index ```x-1``` (due to indexing starting at 0)
4. Try to make your list smaller (by ```pop()```, etc.) if it make your solution faster
5. BE CAREFUL with changing list by calling itself, like:
```python
arr[i], arr[arr[i] - 1] = arr[arr[i] - 1], arr[i]
```
cause it WILL NOT work as you expect due to array changes during this operation

### Links
1. https://en.wikipedia.org/wiki/Computational_complexity



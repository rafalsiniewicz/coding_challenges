### Conclusions 
1. Using only one list (and sorting it in loop and update) made program faster. 
While using one list for sorted ones and one for keeping up the track the program 
was way slower, about 8 times slower
2. If you have a median related task, you can just store values in dict as `v:cnt`, 
where v- value and cnt- number of value occurences. Then calculating median doesnt 
requite sorting list of values, its just counting up to `n // 2` occurences of numbers
in dict, e.g.:
```python
values = [4,2,5,1,6,8,9]
vd = {i: 0 for i in range(max(values) + 1)}
for i in values:
    vd[i] += 1
``` 
### Links
1. https://github.com/nathan-abela/HackerRank-Solutions/blob/master/Interview%20Preparation%20Kit/04%20-%20Sorting/04%20-%20Fraudulent%20Activity%20Notifications.py

### Conclusions 
1. Sometimes task description can be written such way its hard to understand what are
the implementation requirements
2. To reverse order of comparison (asceding/descending) you just need to switch "-"
sign between "ifs", so instead of, e.g.:
```python
if a < b:
    return -1
```
use:
```python
if a < b:
    return 1
```
to get reversed order of comparison
### Links

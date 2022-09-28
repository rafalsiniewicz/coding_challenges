### Conclusions 
1. Dicts are (nearly always) faster to search (```O(1)``` vs ```O(n)```) and remove (```O(1)``` vs ```O(n)```) elements than lists.
2. Always try to improve calculation complexity (use dicts instead of lists if necessary)
3. YOU HAVE TO SEARCH FOR: PATTERNS, FASTER WAYS OF COLLECTING DATA FROM DATA STRUCTURE (e.g. instead of iterating through 3 lists, in 3 nested loops use 1 loop and dict, cause to gather all necessary information youll need only this)
4. If you have a list that have MANY repeated values consider using dict, e.g. instead of ```[1,1,1,1,1,1, ..., 2,2,2,2,2,...]``` just have a dict with values as keys and number of occurencess as values in dict (it will be much faster to collect info from dict), ```{1: 100, 2: 9000, ...}```
5. Try to get informations in the SIMPLEST and most convenient way, so if you think the dict with lists as values is good then use it; dont need to create dict with values as dicts
6. Use debugger if its hard to fing the bug (especially when there is plenty of [input] data)
### Links

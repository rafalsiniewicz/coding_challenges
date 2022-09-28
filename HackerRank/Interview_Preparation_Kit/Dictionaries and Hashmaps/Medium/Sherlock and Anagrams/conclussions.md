### Conclusions 
1. Look for mathematical connections in dicts/lists, etc. instead of looping through many lists. For example: the number of all substring anagrams that can be created from string ```"aaaa"``` is Newton's symbols sum: ```NS(4,2) + NS(3,2) + NS(2,2) = 6 + 3 + 1 = 10``` 
2. Avoid nested loops (oly use when absolutely necessary)!!! Nested loops make computational complexity at least ```O(n^2)```
3. Hash tables/dicts are much faster to search than arrays. Hash table performs ```O(1)``` in the average case (array perform ```O(n)``` in the average case). In the worst case, the hash table search performs ```O(n)```: when you have collisions and the hash function always returns the same slot.
4. Deleting is also faster for hash tables: ```O(1)``` vs ```O(n)```
### Links

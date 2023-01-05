### Conclusions 
1. Avoid nested loops !!! Nested loops make computational complexity at least ```O(n^2)```, so dont use them. Use dicts instead if more memory usage is not a problem. Store some data in dicts if memory is not a problem, so you can get those data really fast.
2. Sometimes its really useful to use "inversed" storage, e.g. in dicts. For example
if you store data in dict d1 = {x1: y1, x2: y2, ...} i can be really useful to store also
d2 = {y1: x1, y2: x2, ...} with inversed key, value pairs, so you can access values
really fast (by just dict search which has ```O(1)``` notation)
3. Also (related to 2.) storing data in two separate dicts simultaneously is much 
faster than reversing dict at the end to get 2 separate dicts (adding elements to 
dict is only ```O(1)``` computational complex)
4. Hash tables/dicts are much faster to search than arrays. Hash table performs ```O(1)``` in the average case (array perform ```O(n)``` in the average case). In the worst case, the hash table search performs ```O(n)```: when you have collisions and the hash function always returns the same slot.
5. Deleting is also faster for hash tables: ```O(1)``` vs ```O(n)```

### Links

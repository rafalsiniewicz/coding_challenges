A magic square of order n is an arrangement of n2 numbers, usually distinct integers, in a square, such that the n numbers in all rows, all columns, and both diagonals sum to the same constant. A magic square contains the integers from 1 to n2. 
The constant sum in every row, column and diagonal are called the magic constant or magic sum, M. The magic constant of a normal magic square depends only on n and has the following value:
```
M = n(n2+1)/2
```

In any magic square, the first number i.e. 1 is stored at position (n/2, n-1). Let this position be (i,j). The next number is stored at position (i-1, j+1) where we can consider each row & column as circular array i.e. they wrap around.

**Three conditions hold:**
1. The position of next number is calculated by decrementing row number of the previous number by 1, and incrementing the column number of the previous number by 1. At any time, if the calculated row position becomes -1, it will wrap around to n-1. Similarly, if the calculated column position becomes n, it will wrap around to 0.
2. If the magic square already contains a number at the calculated position, calculated column position will be decremented by 2, and calculated row position will be incremented by 1.
3. If the calculated row position is -1 & calculated column position is n, the new position would be: (0, n-2). 


#### Example
Example:
```
Magic Square of size 3
----------------------
 2  7  6
 9  5  1
 4  3  8 

Steps:
1. position of number 1 = (3/2, 3-1) = (1, 2)
2. position of number 2 = (1-1, 2+1) = (0, 0)
3. position of number 3 = (0-1, 0+1) = (3-1, 1) = (2, 1)
4. position of number 4 = (2-1, 1+1) = (1, 2)
   Since, at this position, 1 is there. So, apply condition 2.
   new position=(1+1,2-2)=(2,0)
5. position of number 5=(2-1,0+1)=(1,1)
6. position of number 6=(1-1,1+1)=(0,2)
7. position of number 7 = (0-1, 2+1) = (-1,3) // this is tricky, see condition 3 
   new position = (0, 3-2) = (0,1)
8. position of number 8=(0-1,1+1)=(-1,2)=(2,2) //wrap around
9. position of number 9=(2-1,2+1)=(1,3)=(1,0) //wrap around
```
#### Links
1. https://www.geeksforgeeks.org/magic-square/
  

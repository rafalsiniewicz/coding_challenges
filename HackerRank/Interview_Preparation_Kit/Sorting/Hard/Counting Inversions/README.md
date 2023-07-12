### Link
https://www.hackerrank.com/challenges/ctci-merge-sort/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=sorting

### Description
In an array, , the elements at indices  and  (where ) form an inversion if . In other words, inverted elements  and  are considered to be "out of order". To correct an inversion, we can swap adjacent elements.

Example


To sort the array, we must perform the following two swaps to correct the inversions:

The sort has two inversions:  and .
Given an array , return the number of inversions to sort the array.

Function Description

Complete the function countInversions in the editor below.

countInversions has the following parameter(s):

int arr[n]: an array of integers to sort
Returns

int: the number of inversions
Input Format

The first line contains an integer, , the number of datasets.

Each of the next  pairs of lines is as follows:

The first line contains an integer, , the number of elements in .
The second line contains  space-separated integers, .
Constraints

Sample Input

STDIN       Function
-----       --------
2           d = 2
5           arr[] size n = 5 for the first dataset
1 1 1 2 2   arr = [1, 1, 1, 2, 2]
5           arr[] size n = 5 for the second dataset     
2 1 3 1 2   arr = [2, 1, 3, 1, 2]
Sample Output

0  
4   
Explanation

We sort the following  datasets:

 is already sorted, so there are no inversions for us to correct.
We performed a total of  swaps to correct inversions.
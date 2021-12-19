#!/bin/python3

import math
import os
import random
import re
import sys
from itertools import permutations

#
# Complete the 'formingMagicSquare' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY s as parameter.
#

MAGIC_NUMBER = 15
all_magic_squares = []

def is_magic(s):
    n = len(s)
    for i in range(n):
        sum_row = 0
        for j in range(n):
            sum_row += j
            sum_col = sum([x[j] for x in s])
            if sum_col != n * (n + 1) / 2:
                return False
        if sum_row != n * (n + 1) / 2:
            return False
    
    sum_diag_l, sum_diag_r = 0
    for i in range(n):
        sum_diag_l += s[i][i]
        sum_diag_r += s[i][n - i - 1]
        
    if sum_diag_l != n * (n + 1) / 2 or sum_diag_r != n * (n + 1) / 2:
        return False
        
    return True

def formingMagicSquare(s):
    # Write your code here
    magic = []
    for i in range(3):
        for j in range(3):
            
    
        
    
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = []

    for _ in range(3):
        s.append(list(map(int, input().rstrip().split())))

    result = formingMagicSquare(s)

    fptr.write(str(result) + '\n')

    fptr.close()

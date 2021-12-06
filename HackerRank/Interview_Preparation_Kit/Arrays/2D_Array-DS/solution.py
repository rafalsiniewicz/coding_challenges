#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'hourglassSum' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

def hourglassSum(arr):
    # print(arr)
    hourglasses = []
    for row in range(len(arr) - 2):
        for col in range(len(arr[row]) - 2):
            hourglasses.append(sum(arr[row][col:col+3]) + arr[row+1][col+1] + sum(arr[row+2][col:col+3]))
            
    return max(hourglasses)
    
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    arr = []

    for _ in range(6):
        arr.append(list(map(int, input().rstrip().split())))

    result = hourglassSum(arr)

    fptr.write(str(result) + '\n')

    fptr.close()

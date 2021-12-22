#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'formingMagicSquare' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY s as parameter.
#

def is_magic(s):
    n = len(s)
    magic_number = n * (n ** 2 + 1) / 2
    for i in range(n):
        sum_row = 0
        for j in range(n):
            sum_row += s[i][j]
            sum_col = sum([x[j] for x in s])
            if sum_col != magic_number:
                return False
        if sum_row != magic_number:
            return False

    sum_diag_l = sum_diag_r = 0
    for i in range(n):
        sum_diag_l += s[i][i]
        sum_diag_r += s[i][n - i - 1]


    if sum_diag_l != magic_number or sum_diag_r != magic_number:
        return False

    return True

def make_nxn(arr):
    n = int(math.sqrt(len(arr)))
    return [[arr[i+j*n] for i in range(n)] for j in range(n)]

def permutations(arr, p_c=[], perms=[]):
    perms = perms
    p = p_c
    for i in arr[:]:
        c_arr = arr[:]
        p.append(i)
        c_arr.remove(i)
        if c_arr:
            permutations(c_arr, p[:], perms)
            p.pop()
        else:
            perms.append(p)

    return perms

def calc_cost(a, b):
    cost = 0
    for i in range(len(a)):
        for j in range(len(a)):
            cost += abs(a[i][j] - b[i][j])

    return cost

def formingMagicSquare(s):
    # Write your code here
    magic = []
    n = 3
    all_pos = permutations([i for i in range(1, n**2 + 1)])
    all_pos = list(map(make_nxn, all_pos))
    # print(all_pos)
    all_magic = [i for i in all_pos if is_magic(i) == True]
    # print(all_magic)

    min_cost = -1
    for i in all_magic:
        cost = calc_cost(s,i)
        if cost < min_cost or min_cost == -1:
            min_cost = cost

    return min_cost
            
    
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = []

    for _ in range(3):
        s.append(list(map(int, input().rstrip().split())))

    result = formingMagicSquare(s)

    fptr.write(str(result) + '\n')

    fptr.close()

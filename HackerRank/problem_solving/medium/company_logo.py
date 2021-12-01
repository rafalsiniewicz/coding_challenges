#!/bin/python3

import math
import os
import random
import re
import sys

def fun(s):
    letters = list(set(s))
    d = dict()
    for l in s:
        if l not in d:
            d[l] = 1
        else:
            d[l] +=1 
    i = 0
    sorted_v = sorted(set(d.values()))
    sorted_v.reverse()
    sorted_d = dict()
    for v in sorted_v:
        for k in sorted(d.keys()):
            if v == d[k]:
                sorted_d[k] = v
                
    # print(sorted_d)
    for k in sorted_d:
        print(k, sorted_d[k])
        i += 1
        if i == 3:
            break
        

if __name__ == '__main__':
    s = input()
    fun(s)

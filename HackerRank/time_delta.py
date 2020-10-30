#!/bin/python
import math
import os
import random
import re
import sys


def month_delta(year1, year2, month1, month2):
    if (year1 == year2 and month1 < month2) or year1 < year2:
        raise ValueError("date1 must be after date2")
    months = 0
    if year1 == year2:
        months = month1 - month2
    elif year1 > year2:
        while year1 > year2:
            months = months + 12 - month2
            month2 = 0
            year2 += 1

        months = months + month1 - month2

    return months

def day_delta(year1, month1, day1, year2, month2, day2):
    if (month1 == month2 and day1 < day2) or month1 < month2:
        raise ValueError("date1 must be after date2")

    days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    days = 0
    if year1 == year2:
        if year1 % 4 == 0 and year1 % 100 != 0 or year1 % 400 == 0:
            days_in_month[1] = 29
        if month1 == month2:
            days = day1 - day2
        elif month1 > month2:
            while month1 > month2:
                days = days + days_in_month[month2 - 1] - day2
                day2 = 0
                month2 += 1

            days = days + day1 - day2

    elif year1 > year2:
        while not (year1 == year2 and month1 == month2):
            if year2 % 4 == 0 and year2 % 100 != 0 or year2 % 400 == 0:
                days_in_month[1] = 29
            days = days + days_in_month[month2 - 1] - day2
            day2 = 0
            month2 += 1
            if month2 > 12:
                month2 = 1
                year2 += 1

        days = days + day1 - day2

    return days

days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
month_to_number = {"January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6, "July": 7, "August": 8,
                       "September": 9, "October": 10, "November": 11, "December": 12}

def is_leap(year):
    if year % 4 == 0 and year % 100 != 0 or year % 400 == 0:
        return True
    else:
        return False

def to_seconds(year, month, day, hour, minute, second, is_leap=False):
    if is_leap:
        days_in_month[1] = 29

    month_counter = sum(days_in_month[0:month-1])

    return year * 31536000 + month_counter * 24 * 3600 + day * 24 * 3600 + hour * 3600 + minute * 60 + second



# Complete the time_delta function below.
def time_delta(t1, t2):
    # return t1 - t2
    t1_split = t1.split()
    t2_split = t2.split()

    t1_time = {"timezone": t1_split[5],
               "hour": int(t1_split[4].split(':')[0]),
               "minute": int(t1_split[4].split(':')[1]),
               "second": int(t1_split[4].split(':')[2]),
               "year": int(t1_split[3]),
               "month": month_to_number[t1_split[2]],
               "day_of_month": int(t1_split[1]),
               "day_of_week": t1_split[0],
               "offset": t1_split[5]}

    t2_time = {"timezone": t2_split[5],
               "hour": int(t2_split[4].split(':')[0]),
               "minute": int(t2_split[4].split(':')[1]),
               "second": int(t2_split[4].split(':')[2]),
               "year": int(t2_split[3]),
               "month": month_to_number[t2_split[2]],
               "day_of_month": int(t2_split[1]),
               "day_of_week": t2_split[0],
               "offset": t2_split[5]}

    if is_leap(t1_time["year"]):
        t1_secs = to_seconds(t1_time["year"], t1_time["month"], t1_time["day_of_month"], t1_time["hour"], t1_time["minute"],
                             t1_time["second"], is_leap=True)
    else:
        t1_secs = to_seconds(t1_time["year"], t1_time["month"], t1_time["day_of_month"], t1_time["hour"], t1_time["minute"],
                             t1_time["second"])

    if is_leap(t2_time["year"]):
        t2_secs = to_seconds(t2_time["year"], t2_time["month"], t2_time["day_of_month"], t2_time["hour"], t2_time["minute"],
                             t2_time["second"], is_leap=True)
    else:
        t2_secs = to_seconds(t2_time["year"], t2_time["month"], t2_time["day_of_month"], t2_time["hour"], t2_time["minute"],
                             t2_time["second"])

    if t1_time["offset"][0] == "+":
        t1_secs -= int(t1_time["offset"][1:3]) * 3600
        t1_secs -= int(t1_time["offset"][3:]) * 60
    else:
        t1_secs += int(t1_time["offset"][1:3]) * 3600
        t1_secs += int(t1_time["offset"][3:]) * 60

    if t2_time["offset"][0] == "+":
        t2_secs -= int(t2_time["offset"][1:3]) * 3600
        t1_secs -= int(t2_time["offset"][3:]) * 60
    else:
        t2_secs += int(t2_time["offset"][1:3]) * 3600
        t2_secs += int(t2_time["offset"][3:]) * 60

    return str(t1_secs - t2_secs)

if __name__ == '__main__':
    # 2
    # Sun 10 May 2015 13:54:36 -0700
    # Sun 10 May 2015 13:54:36 -0000
    # Sat 02 May 2015 19:54:36 +0530
    # Fri 01 May 2015 13:54:36 -0000
    fptr = open("output.txt", 'w')

    t = int(input())

    for t_itr in range(t):
        t1 = input()
        t2 = input()

        delta = time_delta(t1, t2)

        fptr.write(delta + '\n')

    fptr.close()

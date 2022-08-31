#!/bin/python3
MONTHS = {'Jan': {'number': 1, 'days': 31}, 'Feb': {'number': 2, 'days': [28, 29]},
          'Mar': {'number': 3, 'days': 31}, 'Apr': {'number': 4, 'days': 30}, 'May': {'number': 5, 'days': 31},
          'Jun': {'number': 6, 'days': 30}, 'Jul': {'number': 7, 'days': 31}, 'Aug': {'number': 8, 'days': 31},
          'Sep': {'number': 9, 'days': 30}, 'Oct': {'number': 10, 'days': 31},
          'Nov': {'number': 11, 'days': 30}, 'Dec': {'number': 12, 'days': 31}}

SECONDS_IN_MINUTE = 60
SECONDS_IN_HOUR = SECONDS_IN_MINUTE * 60
SECONDS_IN_DAY = 24 * SECONDS_IN_HOUR
SECONDS_IN_LEAP = 366 * SECONDS_IN_DAY
SECONDS_IN_NORMAL = 365 * SECONDS_IN_DAY

def _is_leap(year):
    """
    Check if year is leap
    :param year:
    :return:
    """
    if ((year % 400 == 0) and (year % 100 == 0)) or ((year % 4 == 0) and (year % 100 != 0)):
        return True
    else:
        return False


def get_years(year):
    """
    Get number of leap years and number of normal years until the year
    :return leap_years, normal_years (int, int):
    """
    leap_cnt = 0

    for y in range(year):
        if _is_leap(y):
            leap_cnt += 1

    return leap_cnt, year - leap_cnt


def time(t):
    """
    :return (day, month, year, hour, minute, second, time_zone_hour, time_zone_minute) (int, int, int, int, int, float):
    """

    t = t.split(" ")
    day = int(t[1])
    month = MONTHS[t[2]]['number']
    year = int(t[3])
    hour = int(t[4].split(':')[0])
    minute = int(t[4].split(':')[1])
    second = int(t[4].split(':')[2])
    time_zone_hour = int(t[5][:3])
    time_zone_minute = int(t[5][3:]) if t[5][0] == '+' else -int(t[5][3:])

    return day, month, year, hour, minute, second, time_zone_hour, time_zone_minute


def time_in_seconds(day, month, year, hour, minute, second, time_zone_hour, time_zone_minute):
    """

    :param day:
    :param month:
    :param year:
    :param hour:
    :param minute:
    :param second:
    :return time_in_seconds (int):
    """
    days_in_months = 0
    for k, v in MONTHS.items():
        if v['number'] < month:
            if v['number'] == 2:
                if _is_leap(year):
                    days_in_months += v['days'][1]
                else:
                    days_in_months += v['days'][0]
            else:
                days_in_months += v['days']

    leap_years, normal_years = get_years(year)
    return day * SECONDS_IN_DAY + days_in_months * SECONDS_IN_DAY + leap_years * SECONDS_IN_LEAP + \
           normal_years * SECONDS_IN_NORMAL + hour * SECONDS_IN_HOUR + minute * SECONDS_IN_MINUTE + \
           second - time_zone_hour * SECONDS_IN_HOUR - time_zone_minute * SECONDS_IN_MINUTE


# Complete the time_delta function below.
def time_delta(t1, t2):
    day1, month1, year1, hour1, minute1, second1, time_zone_hour1, time_zone_minute1 = time(t1)
    day2, month2, year2, hour2, minute2, second2, time_zone_hour2, time_zone_minute2 = time(t2)
    scs1 = time_in_seconds(day1, month1, year1, hour1, minute1, second1, time_zone_hour1, time_zone_minute1)
    scs2 = time_in_seconds(day2, month2, year2, hour2, minute2, second2, time_zone_hour2, time_zone_minute2)
    return abs(scs1 - scs2)


if __name__ == '__main__':
    # f = open("case1.txt", "r")
    # for i in f:
    #     print(time_delta(i, next(f)))
    # print(time_delta("Sun 10 May 2015 13:54:36 -0700", "Sun 10 May 2015 13:54:36 -0000"))
    # print(time_delta("Sat 02 May 2015 19:54:36 +0530", "Fri 01 May 2015 13:54:36 -0000"))
    # print(time_delta("Fri 11 Feb 2078 00:05:21 +0400", "Mon 29 Dec 2064 03:33:48 -1100"))
    print(time_delta("Thu 16 Jul 2026 06:28:56 -0930", "Sun 20 Apr 2149 00:02:39 -0400"))
    pass

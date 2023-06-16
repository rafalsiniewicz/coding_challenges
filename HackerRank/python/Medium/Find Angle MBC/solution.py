from math import asin, sqrt, pi


def mbc_angle(ab, bc):
    return str(int(180 / pi * asin(ab / (sqrt(ab**2 + bc**2))) + 0.5)) + u'\N{DEGREE SIGN}'


if __name__ == '__main__':
    ab, bc = int(input()), int(input())
    print(mbc_angle(ab, bc))

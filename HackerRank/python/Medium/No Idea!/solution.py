import time


def happiness(array, a, b):
    numbers = {}
    _happiness = 0

    for i in array:
        if i in numbers:
            numbers[i] += 1
        else:
            numbers[i] = 1
    for i in a:
        if i in numbers:
            _happiness += numbers[i]
    for i in b:
        if i in numbers:
            _happiness -= numbers[i]

    return _happiness


if __name__ == '__main__':
    start_time = time.perf_counter_ns()
    # (n, m), array, a, b = (input().split()), [int(i) for i in input().split()], [int(i) for i in input().split()], [
    #     int(i) for i in input().split()]

    # n = 3
    # m = 2
    # array = [1,5,3]
    # a = [3,1]
    # b = [5,7]
    m, n = 100000, 14544
    array = [int(x) for x in open("array.txt", "r").read().split()]
    a = (int(x) for x in open("a.txt", "r").read().split())
    b = (int(x) for x in open("b.txt", "r").read().split())
    print(happiness(array, a, b))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))
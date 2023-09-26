import time


def reverseArray(a):
    reversed_arr = []
    for i in range(len(a) - 1, -1, -1):
        reversed_arr.append(a[i])

    return reversed_arr


if __name__ == '__main__':
    start_time = time.perf_counter_ns()
    print(reverseArray([1, 2, 3]))

    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

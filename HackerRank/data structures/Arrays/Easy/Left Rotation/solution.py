import time


def rotateLeft(d, arr):
    d = d % len(arr)
    temp = arr[:d]
    arr = arr[d:]
    arr += temp

    return arr


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(rotateLeft(2, [1, 2, 3, 4, 5]))
    print(rotateLeft(4, [1, 2, 3, 4, 5]))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

import time


def hourglassSum(arr):
    n = len(arr) - 2
    values = [[] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            v = sum(arr[i][j:j + 3])
            v += arr[i + 1][j + 1]
            v += sum(arr[i + 2][j:j + 3])
            values[i].append(v)

    values = [y for x in values for y in x]
    return max(values)


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(hourglassSum(
        [[-9, -9, -9, 1, 1, 1], [0, -9, 0, 4, 3, 2], [-9, -9, -9, 1, 2, 3], [0, 0, 8, 6, 6, 0], [0, 0, 0, -2, 0, 0],
         [0, 0, 1, 2, 4, 0]]))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

import time


# def minimumSwaps(arr):
#     swaps_cnt = 0
#     for i in range(len(arr)):
#         for j in range(len(arr)):
#             if arr[i] != i + 1:
#                 if arr[j] == i + 1:
#                     arr[i], arr[j] = arr[j], arr[i]
#                     swaps_cnt += 1
#
#     return swaps_cnt

# def minimumSwaps(arr):
#     swaps_cnt = 0
#     for i in range(len(arr) - 1):
#         if arr[0] != i + 1:
#             ind = arr.index(i+1)
#             arr[0], arr[ind] = arr[ind], arr[0]
#             swaps_cnt += 1
#         arr.pop(0)
#
#     return swaps_cnt


def minimumSwaps(arr):
    swaps = 0
    i = 0
    while i < len(arr):
        if arr[i] != i + 1:
            a = arr[i]
            b = arr[arr[i]-1]
            arr[i], arr[a - 1] = b, a
            swaps += 1
            continue
        i += 1
    return swaps

if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    print(minimumSwaps([7, 1, 3, 2, 4, 5, 6]))
    print(minimumSwaps([4, 3, 1, 2]))
    print(minimumSwaps([2, 3, 4, 1, 5]))
    print(minimumSwaps([1, 3, 5, 2, 4, 6, 7]))
    a = [2, 31, 1, 38, 29, 5, 44, 6, 12, 18, 39, 9, 48, 49, 13, 11, 7, 27, 14, 33, 50, 21, 46, 23, 15, 26, 8, 47, 40, 3, 32, 22, 34,
         42, 16, 41, 24, 10, 4, 28, 36, 30, 37, 35, 20, 17, 45, 43, 25, 19]
    print(minimumSwaps(a))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

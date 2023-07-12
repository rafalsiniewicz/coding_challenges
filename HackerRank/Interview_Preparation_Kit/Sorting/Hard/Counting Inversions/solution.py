import time


# def countInversions(arr):
#     result = 0
#     for i in range(len(arr)):
#         for j in range(len(arr) - i - 1):
#             if arr[j] > arr[j + 1]:
#                 result += 1
#                 arr[j], arr[j + 1] = arr[j + 1], arr[j]
#
#     return result

# def countInversions(arr):
#     result = 0
#     nr_arr = [0] * (max(arr) + 1)
#     for i in arr:
#         nr_arr[i] += 1
#
#     for i in arr:
#         s = 0
#         for j in range(i):
#             s += nr_arr[j]
#         result += s
#         nr_arr[i] -= 1
#
#     for i in arr:
#         # result += sum(nr_arr[:i])
#         nr_arr[i] -= 1
#
#     return result

# def countInversions(arr):
#     result = 0
#     for i in range(len(arr)):
#         for j in range(i+1, len(arr)):
#             if arr[i] > arr[j]:
#                 result += 1
#
#     return result

# def countInversions(arr):
#     inv_cnt = 0
#     if len(arr) > 1:
#
#         # Finding the mid of the array
#         mid = len(arr) // 2
#
#         # Dividing the array elements
#         L = arr[:mid]
#
#         # Into 2 halves
#         R = arr[mid:]
#
#         # Sorting the first half
#         inv_cnt += countInversions(L)
#
#         # Sorting the second half
#         inv_cnt += countInversions(R)
#
#         i = j = k = 0
#
#         # Copy data to temp arrays L[] and R[]
#         while i < len(L) and j < len(R):
#             if L[i] <= R[j]:
#                 arr[k] = L[i]
#                 i += 1
#             else:
#                 arr[k] = R[j]
#                 j += 1
#                 inv_cnt += (mid-i)
#             k += 1
#
#         # Checking if any element was left
#         while i < len(L):
#             arr[k] = L[i]
#             i += 1
#             k += 1
#
#         while j < len(R):
#             arr[k] = R[j]
#             j += 1
#             k += 1
#
#     return inv_cnt


def merge(left, right, arr):
    cnt_inv = 0
    i = j = k = 0

    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            arr[k] = left[i]
            i += 1
            k += 1
        else:  # swap
            arr[k] = right[j]
            j += 1
            k += 1
            cnt_inv += (len(left) - i)

    while i < len(left):
        arr[k] = left[i]
        i += 1
        k += 1

    while j < len(right):
        arr[k] = right[j]
        j += 1
        k += 1

    return cnt_inv

def countInversions(arr):
    cnt_inv = 0
    if len(arr) > 1:
        mid = len(arr) // 2
        left = arr[:mid]
        right = arr[mid:]

        cnt_inv += countInversions(left)
        cnt_inv += countInversions(right)
        cnt_inv += merge(left, right, arr)
    return cnt_inv


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(countInversions([2, 4, 1]))
    print(countInversions([4, 2, 1]))
    print(countInversions([4, 3, 2, 1]))
    print(countInversions([5, 4, 3, 2, 1]))
    print(countInversions([1, 1, 1, 2, 2]))
    print(countInversions([2, 1, 3, 1, 2]))

    print(countInversions([int(x) for x in open("a.txt", "r").read().split()]))
    print(countInversions([int(x) for x in open("b.txt", "r").read().split()]))

    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

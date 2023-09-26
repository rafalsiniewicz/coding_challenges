# def minimumAbsoluteDifference(arr):
#     min_abs = 2000000000
#     for i in range(len(arr) - 1):
#         for j in range(i + 1, len(arr)):
#             abs_val = abs(arr[j] - arr[i])
#             if abs_val < min_abs:
#                 min_abs = abs_val
#             if min_abs == 0:
#                 return min_abs
#
#     return min_abs

def merge_arr(arr, l, r):
    l_i = 0
    r_i = 0
    arr_i = 0
    # print(l,r)
    for i in range(min(len(l), len(r))):
        if l[l_i] < r[r_i]:
            arr[i] = l[l_i]
            arr_i += 1
            l_i += 1
        else:
            arr[i] = r[r_i]
            arr_i += 1
            r_i += 1


    # print(l_i, r_i)
    # merge rest
    # left
    if r_i == len(r):
        for i in range(l_i, len(l)):
            arr[arr_i] = l[i]
            arr_i += 1
    elif l_i == len(l):
        for i in range(r_i, len(r)):
            arr[arr_i] = r[i]
            arr_i += 1
    else:
        while l_i < len(l):
            if l[l_i] < r[r_i]:
                arr[arr_i] = l[l_i]
                arr_i += 1
                l_i += 1
            else:
                arr[arr_i] = r[r_i]
                arr_i += 1
                r_i += 1
                if r_i == len(r):
                    break

        for i in range(l_i, len(l)):
            arr[arr_i] = l[i]
            arr_i += 1

        for i in range(r_i, len(r)):
            arr[arr_i] = r[i]
            arr_i += 1

    # print(arr)

def merge_sort_arr(arr):
    if len(arr) > 1:
        m = len(arr) // 2
        l = arr[:m]
        r = arr[m:]
        merge_sort_arr(l)
        merge_sort_arr(r)
        merge_arr(arr, l, r)


# def minimumAbsoluteDifference(arr):
#     merge_sort_arr(arr)
#     # arr = sorted(arr)
#     min_abs = 2000000000
#     for i in range(len(arr)-1):
#         abs_val = abs(arr[i] - arr[i+1])
#         if abs_val < min_abs:
#             min_abs = abs_val
#
#     return min_abs


# def partition(arr, l, r):
#     pivot = arr[r]
#     i = l-1
#     for j in range(l,r):
#         if arr[j] <= pivot:
#             i += 1
#             arr[i], arr[j] = arr[j], arr[i]
#
#     i += 1
#     # print(arr)
#     # print(i)
#     arr[r], arr[i] = arr[i], arr[r]
#     # print(arr)
#     return i
#
#
# def quick_sort_arr(arr):
#     if len(arr) > 1:
#         pivot = partition(arr, 0, len(arr)-1)
#         # arr = quick_sort_arr(arr[:pivot])
#         # arr = quick_sort_arr(arr[pivot+1:])
#         return quick_sort_arr(arr[:pivot]) + [arr[pivot]] + quick_sort_arr(arr[pivot+1:])
#         # return arr
#
#     return arr

def partition(arr, l, r):
    # print(arr)
    # print(l, r)
    pivot = arr[r]
    i = l - 1
    for j in range(l, r):
        if arr[j] <= pivot:
            i += 1
            arr[i], arr[j] = arr[j], arr[i]

    arr[i+1], arr[r] = arr[r], arr[i+1]
    # print(arr)
    return i + 1

def quick_sort_arr(arr, l, r):
    if l < r:
        pivot = partition(arr, l, r)
        quick_sort_arr(arr, l, pivot-1)
        quick_sort_arr(arr, pivot+1, r)


def minimumAbsoluteDifference(arr):
    quick_sort_arr(arr, 0, len(arr) - 1)
    # print(arr)
    # arr = sorted(arr)
    min_abs = 2000000000
    for i in range(len(arr)-1):
        abs_val = abs(arr[i] - arr[i+1])
        if abs_val < min_abs:
            min_abs = abs_val

    return min_abs


if __name__ == "__main__":
    print(minimumAbsoluteDifference([-2, 2, 4]))
    print(minimumAbsoluteDifference([3, -7, 0]))
    print(minimumAbsoluteDifference([-59, -36, -13, 1, -53, -92, -2, -96, -54, 75]))
    print(minimumAbsoluteDifference([1, -3, 71, 68, 17]))

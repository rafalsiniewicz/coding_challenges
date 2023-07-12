# def arrayManipulation(n, queries):
#     arr = [0] * n
#     for i in queries:
#         for j in range(i[0] - 1, i[1]):
#             arr[j] += i[2]
#
#     return max(arr)


# def arrayManipulation(n, queries):
#     arr = [0] * n
#     for i in queries:
#         arr[i[0]-1:i[1]] = map(lambda x: x + i[2], arr[i[0]-1:i[1]])
#
#     return max(arr)


def arrayManipulation(n, queries):
    arr = [0] * n
    for i in queries:
        arr[i[0] - 1] += i[2]
        if i[1] < n:
            arr[i[1]] -= i[2]

    result = 0
    max_result = 0
    for i in arr:
        result += i
        if result > max_result:
            max_result = result

    return max_result


if __name__ == '__main__':
    # n = 10
    # q = [[1, 5, 3], [4, 8, 7], [6, 9, 1]]
    # print(arrayManipulation(n, q))
    # n = 5
    # q = [[1, 2, 100], [2, 5, 100], [3, 4, 100]]
    # print(arrayManipulation(n, q))
    # n = 10
    # q = [[2, 6, 8], [3, 5, 7], [1, 8, 1], [5, 9, 15]]
    # print(arrayManipulation(n, q))
    n = 4
    q = [[2, 3, 603], [1, 1, 286], [4, 4, 882]]
    print(arrayManipulation(n, q))

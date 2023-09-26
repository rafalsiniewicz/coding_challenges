import time


# def is_special(s):
#     special = True
#     for i in range(len(s) - 1):
#         if len(s) % 2 == 0:
#             if s[i] != s[i + 1]:
#                 special = False
#         else:
#             if i != len(s) // 2 and (s[i] != s[len(s) - i - 1] or s[i] != s[0]):
#                 special = False
#
#     return special


# O(n^2)
# def substrCount(n, s):
#     result = 0
#     all_substr = []
#     for i in range(n):
#         for j in range(i+1, n+1):
#             all_substr.append(s[i:j])
#
#     # print(all_substr)
#     for i in all_substr:
#         if is_special(i):
#             # print(i)
#             result += 1
#
#     return result


def substrCount(n, s):
    result = 0
    for i in range(n - 1):
        result += 1
        cnt = 1
        for j in range(i + 1, n):
            if s[i] != s[j]:
                same = True
                for k in range(cnt):
                    if j + 1 + k < n:
                        if s[i] != s[j + 1 + k]:
                            same = False
                            break
                    else:
                        same = False
                if same is True:
                    result += 1
                break
            else:
                cnt += 1
                result += 1
    result += 1  # last char
    return result


if __name__ == '__main__':
    start_time = time.perf_counter_ns()
    print(substrCount(8, "mnonopoo"))
    print(substrCount(5, "asasd"))
    print(substrCount(7, "abcbaba"))
    print(substrCount(4, "aaaa"))
    # print(substrCount(5, "aabaa"))
    s = open("a.txt", "r").read()
    print(substrCount(727310, s))
    s = open("b.txt", "r").read()
    print(substrCount(55269, s))

    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

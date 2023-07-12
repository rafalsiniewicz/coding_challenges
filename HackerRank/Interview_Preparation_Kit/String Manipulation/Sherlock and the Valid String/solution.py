import time

def isValid(s):
    s_dict = {}

    # count letters freq in word
    for i in s:
        if i in s_dict:
            s_dict[i] += 1
        else:
            s_dict[i] = 1

    # # verify if valid
    # valid = True
    # n = len(s) // len(list(s_dict.keys()))
    # if all([s_dict[i] == n for i in s_dict]):  # all the same freq
    #     return "YES"
    # else:  # not all the same freq
    #     flag = False
    #     for i in s_dict:
    #         if s_dict[i] != n:
    #             if s_dict[i] - n > 1:
    #                 valid = False
    #             else:
    #                 if flag is False:
    #                     flag = True
    #                 else:
    #                     valid = False
    #
    # return "YES" if valid else "NO"

    valid = True
    # find the most freq. nr
    most_freq = max(list(s_dict.values()), key=list(s_dict.values()).count)
    non_most_freq = [i for i in list(s_dict.values()) if i != most_freq]
    if len(non_most_freq) > 1:
        return "NO"
    for i in s_dict:
        if s_dict[i] - most_freq > 1:
            valid = False

    return "YES" if valid else "NO"


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(isValid("abc"))
    print(isValid("abcc"))
    print(isValid("abccc"))
    print(isValid("aabbcd"))
    print(isValid("aabbccddeefghi"))
    print(isValid("abcdefghhgfedecba"))
    print(isValid("aabbc"))

    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

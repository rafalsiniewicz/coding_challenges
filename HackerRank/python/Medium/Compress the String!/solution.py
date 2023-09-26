import time


def compress_string(s):
    result = ''
    tmp = 1
    for i in range(len(s)):
        if i == len(s) - 1:
            result += f"({tmp}, {s[i]}) "
        elif s[i+1] == s[i]:
            tmp += 1
            if i == len(s) - 2:
                result += f"({tmp}, {s[i]}) "
                break
        else:
            result += f"({tmp}, {s[i]}) "
            tmp = 1

    return result

    # import itertools
    #
    # result = ''
    # key_func = lambda x: x
    #
    # for key, group in itertools.groupby(s, key_func):
    #     result += f"({len(list(group))}, {key}) "
    #
    # return result


if __name__ == '__main__':
    start_time = time.perf_counter_ns()
    print(compress_string("1222311"))

    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

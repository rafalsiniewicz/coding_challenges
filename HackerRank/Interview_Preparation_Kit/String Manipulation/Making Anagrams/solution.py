import time

def makeAnagram(a, b):
    result = 0
    a_dict = {}
    b_dict = {}
    for i in a:
        if i in a_dict:
            a_dict[i] += 1
        else:
            a_dict[i] = 1

    for i in b:
        if i in b_dict:
            b_dict[i] += 1
        else:
            b_dict[i] = 1

    for i in a_dict:
        if i not in b_dict:
            result += a_dict[i]
        else:
            result += abs(a_dict[i] - b_dict[i])

    for i in b_dict:
        if i not in a_dict:
            result += b_dict[i]

    return result


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(makeAnagram('cde', 'dcf'))
    print(makeAnagram('cde', 'abc'))

    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

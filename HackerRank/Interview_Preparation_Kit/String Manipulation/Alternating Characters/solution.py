import time

def alternatingCharacters(s):
    result = 0
    for i in range(len(s)-1):
        if s[i] == s[i+1]:
            result += 1

    return result


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(alternatingCharacters("AABAAB"))
    print(alternatingCharacters("AAAA"))
    print(alternatingCharacters("BBBBB"))
    print(alternatingCharacters("ABABABAB"))
    print(alternatingCharacters("BABABA"))
    print(alternatingCharacters("AAABBB"))


    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

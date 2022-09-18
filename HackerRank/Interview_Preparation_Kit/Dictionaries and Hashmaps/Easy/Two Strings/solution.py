import time


# def twoStrings(s1, s2):
#     if any(x in s2 for x in s1):
#         return "YES"
#     else:
#         return "NO"

def twoStrings(s1, s2):
    for i in s1:
        if i in s2:
            return "YES"
    return "NO"


if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    print(twoStrings("hello", "world"))
    print(twoStrings("hi", "world"))
    print(twoStrings("and", "art"))
    print(twoStrings("be", "cat"))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

import time

def get_word_dict(w):
    d = dict()
    for i in w:
        if i not in d:
            d[i] = 1
        else:
            d[i] += 1
    return d

# def sherlockAndAnagrams(s):
#     d = dict()
#     for i in range(len(s) - 1):
#         for j in range(len(s)-i):
#             if i + 1 in d:
#                 d[i + 1].append(s[j:j+i + 1])
#             else:
#                 d[i + 1] = [s[j:j+i + 1]]
#     print(d)
#     nr_ann_pairs = 0
#     for i in d:
#         for j in range(len(d[i])):
#             for k in range(j + 1, len(d[i])):
#                 if get_word_dict(d[i][j]) == get_word_dict(d[i][k]):
#                     nr_ann_pairs += 1
#
#     print(d)
#     return nr_ann_pairs


def newtons_symbol2(n):
    return (n * (n - 1)) // 2

def sherlockAndAnagrams(s):
    d = dict()
    nr_ann_pairs = 0
    for i in range(len(s) - 1):
        for j in range(len(s)-i):
            sorted_sj = "".join(sorted(s[j:j+i + 1]))
            if sorted_sj in d:
                d[sorted_sj] += 1
            else:
                d[sorted_sj] = 1

    for k in d:
        nr_ann_pairs += newtons_symbol2(d[k])

    return nr_ann_pairs


if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    print(sherlockAndAnagrams("mom"))
    print(sherlockAndAnagrams("abba"))
    print(sherlockAndAnagrams("abcd"))
    print(sherlockAndAnagrams("ifailuhkqq"))
    print(sherlockAndAnagrams("kkk"))
    print(sherlockAndAnagrams("kkkk"))
    print(sherlockAndAnagrams("kkkkk"))
    # print(sherlockAndAnagrams("ifailuhkqqhucpoltgtyovarjsnrbfpvmupwjjjfiwwhrlkpekxxnebfrwibylcvkfealgonjkzwlyfhhkefuvgndgdnbelgruel"))
    print(sherlockAndAnagrams("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

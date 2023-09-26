import time


def matchingStrings(stringList, queries):
    result = [0] * len(queries)
    for i in range(len(stringList)):
        for j in range(len(queries)):
            if queries[j] == stringList[i]:
                result[j] += 1

    return result


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(matchingStrings(['ab', 'ab', 'abc'], ['ab', 'abc', 'bc']))
    print(matchingStrings(['aba', 'baba', 'aba', 'xzxb'], ['aba', 'xzxb', 'ab']))
    print(matchingStrings(['def', 'de', 'fgh'], ['de', 'lmn', 'fgh']))
    print(matchingStrings(
        ['abcde', 'sdaklfj', 'asdjf', 'na', 'basdn', 'sdaklfj', 'asdjf', 'na', 'asdjf', 'na', 'basdn', 'sdaklfj',
         'asdjf'], ['abcde', 'sdaklfj', 'asdjf', 'na', 'basdn']))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

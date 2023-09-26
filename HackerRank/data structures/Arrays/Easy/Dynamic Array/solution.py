import time


def dynamicArray(n, queries):
    last_answer = 0
    arr = [[] for _ in range(n)]
    answers = []
    for q in queries:
        q_type = int(q[0])
        x = int(q[1])
        y = int(q[2])
        idx = (x ^ last_answer) % n
        if int(q_type) == 1:
            arr[idx].append(y)
        elif int(q_type) == 2:
            last_answer = arr[idx][y % len(arr[idx])]
            answers.append(last_answer)
        else:
            print(f"Wrong query. Should be either 1 or 2, but is: {q_type}")

    return answers


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    print(dynamicArray(2, [["1", "0", "5"], ["1", "1", "7"], ["1", "0", "3"], ["2", "1", "0"], ["2", "1", "1"]]))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

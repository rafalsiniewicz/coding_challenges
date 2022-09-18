import time


def minimumBribes(q):
    size = len(q)
    bribe_count = 0

    cpy_q = q.copy()
    cpy_q.sort()
    for i in range(size):
        curr_val = q[i]
        bribe = cpy_q.index(curr_val)
        if bribe <= 2:
            bribe_count += bribe
        else:
            return 'Too chaotic'
        cpy_q.remove(curr_val)
    return bribe_count


if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    print(minimumBribes([1, 2, 3, 5, 4, 6, 7, 8]))
    print(minimumBribes([4, 1, 2, 3]))
    print(minimumBribes([2, 1, 5, 3, 4]))
    print(minimumBribes([2, 5, 1, 3, 4]))
    print(minimumBribes([5, 1, 2, 3, 7, 8, 6, 4]))
    print(minimumBribes([1, 2, 5, 3, 7, 8, 6, 4]))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

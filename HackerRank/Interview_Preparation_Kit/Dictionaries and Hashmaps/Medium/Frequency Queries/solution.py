import time


def freqQuery(queries):
    result = []
    ds = {}
    numbers = {}
    for i in queries:
        if i[0] == 1:
            if i[1] in ds:
                numbers[ds[i[1]]].remove(i[1])
                ds[i[1]] += 1
                if ds[i[1]] in numbers:
                    numbers[ds[i[1]]].append(i[1])

                else:
                    numbers[ds[i[1]]] = [i[1]]
            else:
                ds[i[1]] = 1
                if ds[i[1]] in numbers:
                    numbers[ds[i[1]]].append(i[1])
                else:
                    numbers[ds[i[1]]] = [i[1]]

        elif i[0] == 2:
            if i[1] in ds and ds[i[1]] > 0:
                numbers[ds[i[1]]].remove(i[1])
                ds[i[1]] -= 1
                if ds[i[1]] in numbers:
                    numbers[ds[i[1]]].append(i[1])
                else:
                    numbers[ds[i[1]]] = [i[1]]
        elif i[0] == 3:
            x = 0
            if numbers.get(i[1]):
                x = 1
            # if i[1] in ds.values():
            #     x = 1
            # for k in ds:
            #     if ds[k] == i[1]:
            #         x = 1
            #         break
            result.append(x)
        else:
            raise ValueError("Operation can be only: 1, 2 or 3")

    return result


if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    print(freqQuery([(1, 5), (1, 6), (3, 2), (1, 10), (1, 10), (1, 6), (2, 5), (3, 2)]))
    print(freqQuery([(3, 4), (2, 1003), (1, 16), (3, 1)]))
    print(freqQuery([(1, 3), (2, 3), (3, 2), (1, 4), (1, 5), (1, 5), (1, 4), (3, 2), (2, 4), (3, 2)]))
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

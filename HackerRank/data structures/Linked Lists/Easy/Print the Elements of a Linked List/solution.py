import time


def printLinkedList(head):
    while head is not None:
        print(head.data)
        head = head.next


if __name__ == '__main__':
    start_time = time.perf_counter_ns()


    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

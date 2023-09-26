import time


class SinglyLinkedListNode:
    def __init__(self, node_data):
        self.data = node_data
        self.next = None


class SinglyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None


def print_singly_linked_list(node, sep, fptr):
    while node:
        fptr.write(str(node.data))

        node = node.next

        if node:
            fptr.write(sep)


def insertNodeAtHead(llist, data):
    if llist is None:
        llist = SinglyLinkedListNode(data)
        return llist
    else:
        new_head = SinglyLinkedListNode(data)
        new_head.next = llist
        return new_head


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    llist = SinglyLinkedList()
    llist_head = insertNodeAtHead(llist.head, 141)
    llist_head = insertNodeAtHead(llist_head, 302)
    llist_head = insertNodeAtHead(llist_head, 164)
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

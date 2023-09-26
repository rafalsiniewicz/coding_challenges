import time

class SinglyLinkedListNode:
    def __init__(self, node_data):
        self.data = node_data
        self.next = None

class SinglyLinkedList:
    def __init__(self):
        self.head = None

def print_singly_linked_list(node, sep, fptr):
    while node:
        fptr.write(str(node.data))

        node = node.next

        if node:
            fptr.write(sep)

def insertNodeAtTail(head, data):
    if not head:
        head = SinglyLinkedListNode(data)
        return head
    else:
        temp_head = head
        while temp_head.next is not None:
            temp_head = temp_head.next

        temp_head.next = SinglyLinkedListNode(data)
        return head


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    llist = SinglyLinkedList()
    llist_head = insertNodeAtTail(llist.head, 141)
    llist_head = insertNodeAtTail(llist_head, 302)
    llist_head = insertNodeAtTail(llist_head, 164)
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

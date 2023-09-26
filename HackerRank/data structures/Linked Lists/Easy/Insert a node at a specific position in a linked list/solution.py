import time


class SinglyLinkedListNode:
    def __init__(self, node_data):
        self.data = node_data
        self.next = None


class SinglyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None

    def insert_node(self, node_data):
        node = SinglyLinkedListNode(node_data)

        if not self.head:
            self.head = node
        else:
            self.tail.next = node

        self.tail = node


def print_singly_linked_list(node, sep, fptr):
    while node:
        fptr.write(str(node.data))

        node = node.next

        if node:
            fptr.write(sep)


def insertNodeAtPosition(llist, data, position):
    list_len = 0
    llist_temp = llist
    while llist_temp is not None:
        list_len += 1
        llist_temp = llist_temp.next
    if llist is None:
        if position != 0:
            print(f"Error. List is empty, so cannot insert node at position {position}")
            return None
        else:
            new_node = SinglyLinkedListNode(data)
            new_node.next = llist
            return new_node
    else:
        if position < 0 or position > list_len - 1:
            print(f"Error. List has {list_len} elements, so cannot insert node at position {position}")
            return None
        else:
            new_node = SinglyLinkedListNode(data)
            if position == 0:
                new_node.next = llist
                return new_node
            else:
                idx = 0
                llist_temp = llist
                while idx != position - 1:
                    idx += 1
                    llist_temp = llist_temp.next
                next_temp = llist_temp.next
                llist_temp.next = new_node
                new_node.next = next_temp
                return llist


if __name__ == '__main__':
    start_time = time.perf_counter_ns()

    llist = SinglyLinkedList()
    llist_head = insertNodeAtPosition(llist.head, 141, 0)
    llist_head = insertNodeAtPosition(llist_head, 302, 0)
    llist_head = insertNodeAtPosition(llist_head, 164, 1)
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))

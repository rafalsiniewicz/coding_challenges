### Conclusions 
1. To add node in specific position in list you need to change previous node's
next node and set previous node's next node as the added node next node. Example:
```python
head = Node() # position = 0
first = Node() # position = 1
head.next = first
# Adding new node at position = 1 
add_on_first_position = Node()
head.next = add_on_first_position # change next node of previous node
add_on_first_position.next = first # set next node as previous node next node
```

### Links
1. 
2. 

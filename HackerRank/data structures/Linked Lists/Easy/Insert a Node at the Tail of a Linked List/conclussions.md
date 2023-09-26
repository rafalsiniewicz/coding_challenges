### Conclusions 
1. To insert element to linked list tail you need to first iterate all the way
to the tail of linked list and add element to the end node, so as the 
`last_node.next` elem:
```python
while head.next is not None:
    head = head.next
head.next = new_elem # head is at the tail
```

### Links
1. 
2. 

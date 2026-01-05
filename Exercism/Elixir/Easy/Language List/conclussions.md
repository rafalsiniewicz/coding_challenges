# Conclussions
1. Lists are elixir built-in type
2. Lists are denoted by square brackets, e.g.:
```elixir
empty_list = []
one_item_list = [1]
two_item_list = [1, 2]
multiple_type_list = [1, :pi, 3.14, "four"]
```
3. To get a length of a list one need to run `length()` function, e.g.:
```elixir
my_list = [1, "two", 3.0]
length(my_list) # returns 3
```
4. Elixir implements lists as a linked list, where each node stores two values: the first item and another list with all the remaining items. The first item in the list is referred to as the head and the remaining list of items is called the tail. We can use this notation in code:
```elixir
# [1] represented in [head | tail] notation
[1 | []]

# [1, 2, 3] represented in [head | tail] notation
[1 | [2 | [3 | []]]]
```
We can also use pattern matching to get head/tail for defined list, e.g.:
```elixir
[h | t] = [1,2,3] # h = 1, t = [2,3]
```
We can also use pattern matching already in function argument, e.g.:
```elixir
def first([h | _]) do
    h # returns first element of the list (head)
  end

def first([_ | t]) do
    t # returns every-but-first elements of the list (tail)
  end
```
5. We can use `[head|tail]` notation to prepend/append elements to the list:
```elixir
# Suppose
list = [2, 1]

[3, 2, 1] == [3 | list]
# => true
[2, 1, 3] == [list | 3]
# => true
```
6. We can check if element is in the list with `in` keyword, e.g.:
```elixir
"5" in [1,2,3,4,5] 
# => false
5 in [1,2,3,4,5] 
# => true
```

# Links
1. https://www.educative.io/answers/how-to-get-the-length-of-a-list-in-elixir
2. 



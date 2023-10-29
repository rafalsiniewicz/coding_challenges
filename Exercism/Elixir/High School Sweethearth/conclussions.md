# Conclussions
1. Recursion functions are functions that call themselves.
2. Recursive function needs to have at least one `base case` and at least one `recursive case`. `Base case` returns a value without calling the function again (it just returns some value). `Recursive case` calls the function again, modyfying the input so it will match the base case at some point
3. Very often each case (base and recursive ones) are written in its own function clause, e.g.
```elixir
# base case
def count([]), do: 0

# recursive case
def count([_head | tail]), do: 1 + count(tail)
```
4. You need to always define ata least two clauses/cases of recursion functions- at least one base case (returning some value) and at least one recursive case
5. You can use pattern matching in function args, e.g.
```elixir
# base case
def fib(0), do: 0

# base case
def fib(1), do: 1

# recursive case
def fib(n), do: fib(n-2) + fib(n-1)
```

# Links
1. https://exercism.org/tracks/elixir/exercises/bird-count
2. 







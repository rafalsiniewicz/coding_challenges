# Conclussions
1. IF you want strict comparison (strict equality) you need to use `===`, cause it also compares types, i.e.:
```elixir
> 1 == 1.0  # true
> 1 === 1.0 # false
```
analogically with unequality:
```elixir
> 1 !== 1.0     # true
> 1 != 1        # false
```
It works only for numbers, not e.g. for strings:
```elixir
"1" == 1       # false
"1" === 1       # false
```
2. `Enum.chunk_every()` func splits a list into multiple sublists of given length and step, i.e.:
```elixir
> Enum.chunk_every([1,2,3], 2, 1, :discard) # [[1, 2], [2, 3]]
> Enum.chunk_every([1,2,3], 2, 1)           # [[1, 2], [2, 3], [3]]
```

# Links
1. https://exercism.org/tracks/elixir/exercises/sublist
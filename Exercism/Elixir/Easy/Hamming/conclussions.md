# Conclussions
1. `for` loop in elixir example:
```elixir
for i in [1,2,3,4], do: inspect(i)
for i in 1..4, do: inspect(i)
```
2. You can use `Enum.zip` function to "merge" 2 or more iterables into a list of tuples, e.g."
```elixir
iex> Enum.zip([1, 2, 3], [:a, :b, :c])
[{1, :a}, {2, :b}, {3, :c}]
```

# Links
1. https://exercism.org/tracks/elixir/exercises/hamming







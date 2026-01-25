# Conclussions
1. to show number as letter use `<< >>`, i.e.:
```elixir
<<65>> == "A"
```
2. `Enum.chunk_by/2` Splits enumerable on every element for which fun returns a new value (different than previous one).

Returns a list of lists.

Examples
```elixir
Enum.chunk_by([1, 2, 2, 3, 4, 4, 6, 7, 7], &(rem(&1, 2) == 1))
[[1], [2, 2], [3], [4, 4, 6], [7, 7]]

Enum.chunk_by([1, 1, 2, 3, 4, 1, 1, 2, 3, 2, 3, 4], & &1)
[[1, 1], [2], [3], [4], [1, 1], [2], [3], [2], [3], [4]]
```

# Links
1. https://exercism.org/tracks/elixir/exercises/run-length-encoding

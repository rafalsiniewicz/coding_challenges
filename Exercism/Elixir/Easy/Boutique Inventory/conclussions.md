# Conclussions
1. `Enum` is a module which provides algorithms for working with enumerables. It has functions for: sorting, filtering, grouping, counting, searching, finding, min/max, etc.
2. Enumerable is any data that can be iterated over. In elixir enumerable is any data type that implements the `Enumerable` protocol. The most common of these are lists and maps
3. Many `Enum` functions accept a function as an argument:
```elixir
Enum.all?([1, 2, 3, 4, 5], fn x -> x > 3 end)
# => false
```
4. The most common `Enum` functions are `map` and `reduce`
5. `Enum.map/2` replaces every element in enumerable with another element. Second argument of `Enum.map/2` is function that accepts the original element and returns its replacement
6. `Enum.reduce/3` reduces whole enumerable to single value. To achieve this, a special variable `accumulator` is used. `accumulator` carries the intermediate state of the reduction between iterations. Second argument of `Enum.reduce/3` is initial state of `accumulator`. Third argument is function that accepts an element and accumulator and returns the new value for `accumulator`
7. When using maps with `Enum`, the maps are automatically converted into a list of `{key, value}` tuples (keyword lists). To transform it back to map use `Enum.into/2`.
8. `Enum.into/2` transform enumerable into collectable- any data structure implementing `Collectable` protocol
9. You can use `Map.new/2` instead of using `Enum.into/3` or `Enum.map` and later `Enum.into/1` to apply a transformation to a map. But it will always return map instead of letting choose the collectable
10. `Enum.sort/2` takes function as 2nd arg. Function should have 2 arguments and return `true` if the first argument precedes or is in the same place as the second one
11. Remember that sorting structs in `Enum.sort/2` or `Enum.sort_by` should be different than normal sorting of e.g. integers. You need to map values for `Enum.sort_by` and after that sort it `:asc` (by default) or `:desc`
12. `Map.put/3` allows to put/overwrite value under specific key in map

# Links
1. https://exercism.org/tracks/elixir/exercises/boutique-inventory
2. https://hexdocs.pm/elixir/1.15.7/Enum.html#sort/2
3. https://hexdocs.pm/elixir/1.12/Map.html#put/3

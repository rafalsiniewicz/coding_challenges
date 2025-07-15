# Conclussions
1. A `MapSet` is a collection of unique values, representing sets in Elixir
2. `MapSet` can contain values of any kind, without notion of order
3. There is also a `Set` module, but its deprecated in favor of `MapSet`
4. You can transform set into list with `MapSet.to_list/1`
5. You can add or remove elements with `MapSet.put/2` and `MapSet.delete/2`
6. You can query the contents of a set with the functions `MapSet.size/1`, `MapSet.member?/2`, and compare sets with `MapSet.equal?/2`, `MapSet.subset?/2` and `MapSet.disjoint?/2`
7. MapSets can be combined with `MapSet.union/2`, `MapSet.intersection/2`, `MapSet.difference/2` and `MapSet.symmetric_difference/2`
8. You can filter and partition sets with `MapSet.filter/2`, `MapSet.reject/2` and `MapSet.split_with/2` (from Elixir 1.15)
9. 

# Links
1. https://exercism.org/tracks/elixir/exercises/gotta-snatch-em-all







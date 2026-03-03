# Conclussions
1. `NaiveDateTime.from_erl` and `NaiveDateTime.to_erl` are good to work with datetime tuples, e.g.:
```elixir
NaiveDateTime.from_erl!({{year, month, day}, {hour, minute, second}})
```
```elixir
NaiveDateTime.to_erl!(NaiveDateTime.new!(year, month, day, hour, minute, second))
```


# Links
1. https://exercism.org/tracks/elixir/exercises/gigasecond







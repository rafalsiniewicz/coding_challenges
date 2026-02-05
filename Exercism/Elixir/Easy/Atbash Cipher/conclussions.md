# Conclussions
1. `Enum.join` func joins even list of lists, e.g.:
```elixir
Enum.join([["a", "b"], ["c", "d", "e", ["f", "g"]], "h", "i"], " ")
"ab cdefg h i"
```

# Links
1. https://exercism.org/tracks/elixir/exercises/atbash-cipher
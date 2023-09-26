# Conclussions
1. Booleans in elixir works the same way as in other programming languages and its similar to python as you can use words to access boolean functions, so: `and`, `or`, `xor`, `not`, etc.
2. Functions that returns booleans by convention has question mark `?` suffix in their names, e.g.:
```elixir
def a_grater_than_b?(a, b) do
  a > b
end
```
3. Variables that are of boolean type  by convention has question mark `?` suffix in their names, e.g.:
```elixir
a? = false
```
or 
```elixir
def either_true?(a?, b?) do
  a? or b?
end
```


# Links
1. https://exercism.org/tracks/elixir/exercises/pacman-rules

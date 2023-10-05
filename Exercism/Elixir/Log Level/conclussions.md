# Conclussions
1. Atoms in elixir are fixed constant values bound/represented to some integer value internally via lookup table, which are set automatically. It is not possible to change this internal value. Atoms value is its own name. Atoms can be defined as follows:
```elixir
# All atoms are preceded with a ':' then follow with alphanumeric snake-cased characters
variable = :an_atom
```
2. Elixir has `cond` keyword which works similarly to `case\switch` from other
programming languages:
```elixir
cond do
  x > 10 -> :this_might_be_the_way_atom
  y < 7 -> :or_that_might_be_the_way_atom
  true -> :this_is_the_default_way_atom
end
```
If no path evaluates to `true`, an error is raised by the runtime.

# Links
1. https://exercism.org/tracks/elixir/exercises/log-level/edit



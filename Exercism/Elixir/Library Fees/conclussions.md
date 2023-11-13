# Conclussions
1. Elixir provides 4 libraries to work with dates and time, each with its own struct:
- `Date` module, defined with `~D`:
```elixir
~D[2021-01-01]
```
- `Time` module, defined with `~T`:
```elixir
~T[12:00:00]
```
- `NaiveDateTime` module for datetimes without a timezone, defined with `~N`:
```elixir
~N[2021-01-01 12:00:00]
```
- `DateTime` module for datetimes with timezone
2. To compare dates or times use `compare` of `diff` functions from the corresponding module. Comparison operators, such as `==`, `>`, `<` dont do a correct semantic comparison for those structs
3. Pipe operator `|>` gives only the first argument to the next function, e.g.
```elixir
def fun(arg1, arg2), do: 5 end
5 |> fun(3) # calls fun(5, 3)
```
4. To round down a float number use `Float.floor` (returns float number) or `Kernel.trunc` (returns integer) function
5. 

# Links
1. https://exercism.org/tracks/elixir/exercises/library-fees
2. https://hexdocs.pm/elixir/1.15.7/NaiveDateTime.html






# Conclussions
1. `Nil` in elixir is value that means absence of value, like `None` in python or `NULL` in C/C++
2. There is an `if/else` syntax in elixir. But there is not "else if", you can have only if and then else, so just 2 options. To have more options use another `if` inside `else` or `cond` (like if/elif/elif/else) or `case` (with pattern matching)
3. `if` syntax:
```elixir
age = 15
if age >= 18 do
  "You are allowed to drink beer in Poland."
else
  "No beer for you!"
end
```
or one-liner:
```elixir
if age > 16, do: "beer", else: "no beer"
```
Note that for one-line `if` you need to use commas `,` separating condition and `do` from `else`
4. All datatypes evaluate to thruth or false in elixir when theyre encountered in boolean context, e.g. `if` expression. All data are truthly except from `false` and `nil`.
5. NOTE that empty strings, integer 0, empty lists are considered truthly in elixir


# Links
1. https://exercism.org/tracks/elixir/exercises/name-badge






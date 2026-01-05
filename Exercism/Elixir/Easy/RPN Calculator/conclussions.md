# Conclussions
1. In elixir functions that raises errors are to have `!` at the end of their name. This is in comparison with functions that return `{:ok, value}` or `:error`:
```elixir
Map.fetch(%{a: 1}, :b)
# => :error
Map.fetch!(%{a: 1}, :b)
# => raises KeyError
```
2. Elixir provides construct to rescue from errors. The syntax is `try .. rescue`:
```elixir
try do                             #1
  raise RuntimeError, "error"      #2
rescue
  e in RuntimeError -> :error      #3
end
```
3. Right after `try` there is a function call which may produce error
4. In `rescue` section we pattern match on the module name of error
5. **on the left side of `->``:**
- `e` is matched to the error struct.
- `in` is a keyword.
- `RuntimeError` is the error that we want to rescue.
  - If we wanted to rescue from all errors, we could use `_` instead of the module name or omit the `in` keyword entirely.

  **on the right side:**
- the instructions to be executed if the error matches.
6. Errors (also called "exceptions") that can be rescued are structs. 
7. Rescuing errors in Elixir is done very rarely!!!
8. Usually the rescued error is logged or sent to external monitoring service, and then reraised. This means that we usually dont care about the internal structure of the specific error struct
9. Anonymous function needs to be called with dot (`.`):
```elixir
a = fn x -> x + 5
a(10)
# => error
a.(10)
# => 15
```
10. To get struct name use `__struct__` attribute:
```elixir
a = %MyApp.MyModel{}
a.__struct__ == MyApp.MyModel
```
NOTE! `__struct__` doesnt return string, it returns the struct itself
11. To throw an error use `raise` word:
```elixir
if false do
  raise "error, should be true"
end
```

# Links
1. https://exercism.org/tracks/elixir/exercises/rpn-calculator
2. https://stackoverflow.com/questions/39618208/how-to-get-struct-name-in-elixir


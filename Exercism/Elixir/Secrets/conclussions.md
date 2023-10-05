# Conclussions
1. Elixir has two way of declaring anonymous functions (lambdas):
```elixir
adder = fn param ->
  param + 5
end
```
or:
```elixir
adder = &(&1 + 5)
```
in both ways anonymous function is called with `.` before parentheses `()`, so:
```elixir
adder.(5) # outputs 10
adder.(3) # outputs 8
```
2. Elixir has `Bitwise` library (in-build from elixir 1.10, for version 1.9 or lower, you will need to call `require Bitwise`) to use bitwise operators, such as: and, or, xor, etc.  

# Links
1. https://hexdocs.pm/elixir/1.15.6/Bitwise.html
2. https://exercism.org/tracks/elixir/exercises/secrets



# Conclussions
1. Elixir has abs(number) function which returns an integer or float which is the arithmetical absolute value of `number`
2. Elixir has function guards, used by `when` keyword, e.g:
```elixir
def number(n) when n == 7 do
  "Awesome, that's my favorite"
end
def number(_n) do
  "That's not my favorite"
end
```
3. Elixir functions can have default arguments defined with `\\`, e.g:
```elixir
def number(n \\ 13), do: "That's not my favorite"
```
If the function has more than one clause, the default arguments should be defined in a function header (a function without a body) before the function clauses:
```elixir
def number(n \\ 13)
def number(n) when n < 10, do: "Dream bigger!"
def number(n) when n > 100, do: "Not that big..."
```
4. The order of function clauses is really important, e.g.:
```elixir
def compare(secret_number, guess) when secret_number == guess do
    "Correct"
end
def compare(secret_number, guess) when secret_number < guess do
    "Too high"
end
def compare(secret_number, guess) when secret_number > guess do
    "Too low"
end
def compare(secret_number, guess) when abs(secret_number - guess) == 1 do
    "So close"
end
IO.puts(GuessingGame.compare(5, 6)) # "Too high"
```
wont work as wanted since first matching/true clause/guard will be the `secret_number < guess`, so the output will be `"Too high"` instead of `"So close"`
Te first function clause that will have guard with true value will be invoked

# Links
1. https://hexdocs.pm/elixir/1.12.3/Kernel.html#abs/1
2. https://exercism.org/tracks/elixir/exercises/guessing-game



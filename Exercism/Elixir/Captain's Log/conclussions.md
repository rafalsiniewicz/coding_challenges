# Conclussions
1. To choose random element from enumerable (e.g. list, range) use `Enum.random`. This function will pick single element, with every element having equal probabiliyu of being chosen
2. Elixir doesnt have its own function to pick a random float number. To do that we have to use Erlang directly
3. Elixir code runs in the BEAM virtual machine. BEAM is a part of Erlang Run-Time system. 
4. Elixir uses the same run environment as Erlang, i.e. BEAM
5. Elixir provides great interoperability with Erlang libraries
6. One can use Erlang libraries from Elixir code
7. Writing Elixir libraries for functionality which is already provided in Erlang is discouraged
8. Certain functionality, like math operations or timer functions is only available in Elixir via Erlang
9. Erlang module names are `snake_case` atoms, so to call Erlang `pi/0` function from `math` you should run:
```elixir
:math.pi()
# => 3.141592653589793
```  
10. The most commonly used Erlang functions which do not have Elixir equivalent are:
- `:timer.sleep/1` - suspend process for given amount of **milliseconds**
- `:rand.uniform/0` - generate random float `x`, where `0.0 <= x < 1.0`
- `:io_lib.format/2` - provides C-style string formatting. Using it we can print an integer in any base between 2 and 36 or format float with desired precision. The function (as many Erlang functions) returns charlist
- `math` module which provides mathematical functions such as: `sin/1`, `cos/1`, `log2/1`, `log10/1`, `pow/2` and more
11. Erlang standard lib: https://www.erlang.org/doc/apps/stdlib/index.html
12. To check if enumerable contains some element use `Enum.member/2`
13. You cant access module attribute outside of this module
```elixir
defmodule A do
    @attr 2
end
IO.puts(A.attr) # error
IO.puts(A.@attr) # error
```
14. You can check if value is in range, by using `in <int1>..<int2>` operator, e.g.:
```elixir
a = 5 in 1..10 
# => a = true
b = 5 in 1..4
# => b = false
```

# Links
1. https://exercism.org/tracks/elixir/exercises/captains-log
2. https://www.erlang.org/doc/apps/stdlib/index.html

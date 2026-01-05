# Conclussions
1. `IO` module in elixir provides functions to handle input/output
2. To write a string to a standard output use `IO.puts` or `IO.write` functions. `IO.puts` always adds newline at the end of the string, while `IO.write` doesnt do it. Both functions return atom `:ok` if succeed:
```elixir
IO.puts("Hi!")
# > Hi!
# => :ok
```
3. `IO.puts` can write string, but not any other data types. 
4. `IO.inspect` is good for debugging since it can write any data type to standard output. It returns value it was passed without changing it, so it can be used at any point in the code
5. To read line from input use `IO.gets`. It accepts one argument- a string that will print as a prompt for the input. 
6. Use pipe operator `|>` to nested call functions, e.g. instead of:
```elixir
fun1(fun2(fun3(arg)))
```
write:
```elixir
fun3(arg)
|> fun2()
|> fun1()
```
REMEMBER! Function calls are in reverse order using pipe operator (comparing to standard calls).
7. There are 2 `inspect` functions in elixir, `IO.inspect` and `Kernel.inspect`. `Kernel.inspect` returns any given data as a string, so it can be used in string interpolation. 

# Links
1. https://exercism.org/tracks/elixir/exercises/rpg-character-sheet/edit
2. https://hexdocs.pm/elixir/1.15.7/IO.html#inspect/2
3. https://til.hashrocket.com/posts/c1feecc9b0-string-interpolation-with-just-about-anything
4. https://hexdocs.pm/elixir/1.15.7/Kernel.html#inspect/2






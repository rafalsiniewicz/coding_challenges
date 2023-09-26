# Conclussions
1. Elixir has two extensions: .ex and .exs. The 2nd one (.exs) is used for scripting and 1st one (.ex) is used for compiling
2. `defmodule` is a macro to create our own modules in Elixir. The first letter of the module must be in uppercase. We use the `def` macro to define functions in that module. The first letter of every function must be in lowercase (or underscore), e.g.:
```elixir
iex> defmodule Math do
...>   def sum(a, b) do
...>     a + b
...>   end
...> end

iex> Math.sum(1, 2)
3
```
3. We can compile .ex files with `elixirc` command:
```bash
>> elixirc math.ex
```


# Links
1. https://elixir-lang.org/getting-started/modules-and-functions.html#scripted-mode
2. https://elixir-lang.org/getting-started/modules-and-functions.html

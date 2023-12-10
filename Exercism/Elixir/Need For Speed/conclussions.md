# Conclussions
1. To share a code between elixir modules you need to reference the outside module by its full name. To make it shorter use `alias` keyword
2. `alias` allows to shorten or change the name of the referenced module
3. `alias` used without arguments it trims down the module name to its last segment, e.g. `MyApp.Logger.Settings` becomes `Settings`
4. Custom name of referenced module can be specified with `:as` option:
```elixir
defmodule Square do
  alias Integer, as: I

  def area(a), do: I.pow(a, 2)
end
```
5. Aliases are usually added at the beggining of module definition
6. `Import` allows you to use functions from outside module without using the module's name.
7. Importing a whole module might create conflicts with existing local functions. To avoid this, two options are available: `:except` and `:only`. Both expect a keyword list, where key is a function name and the value is the funtion arity (number of args)
8. Usually imports are added at the beggining of module definition:
```elixir
defmodule Square do
  import Integer, only: [pow: 2]

  def area(a), do: pow(a, 2)
end
```
9. To reference/import/alias files in elixir you need to compile referenced files and they need to be in the same dir as the file in which they are referenced
10. 

# Links
1. https://exercism.org/tracks/elixir/exercises/need-for-speed


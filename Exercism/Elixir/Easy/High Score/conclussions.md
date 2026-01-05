# Conclussions
1. Maps are elixir data structure to store data in key-value pairs (like dicts in python or hashes in perl)
2. Keys and values can be of any data type, but if a key is an atom we can use a shorthand syntax
3. Maps do not guarantee the order of their entries when accessed or returned
4. Declaring maps:
```elixir
# If the key is an atom:
%{atom_key: 1}

# If the key is a different type:
%{1 => :atom_value}

# You can even mix these if the atom form comes second:
%{"first_form" => :a, atom_form: :b}
```
5. If the key in map is an atom you can declare this key-value pair just like in python's dict, so: `key: value`. If the key is any other type then you use syntax: `key => value`. You can mix those options in one map, but shorthand hase to be at the end !!!
6. You can define empty map by just `%{}`
7. Elixir's `Map module` provides many functions to work with maps.
8. Some `Map module` functions require anonymous functions to be passed as an argument to assist with the map transformation
9. Modules in elixir can have attributes, which are used as constants in modules functions, e.g.
```elixir
defmodule Example do

  # Defines the attribute as the value 1
  @constant_number 1

  def example_value() do
    # Returns the value 1
    @constant_number
  end
end
```
10. Modules attributes are defined with `@` symbol, e.g.: `@constant_string "hello"`
11. Modules attributes can be any expression which can be evaluated during compilation time.
12. After compilation, modules attributes are not accessible since theyre expanded during compilation, similarly to defined macros in, e.g. C language
13. To have a default value in function use `\\` with value after an arg, e.g.:
```elixir
# returns 5 by default
def fun(number \\ 5) do
    number
end
```
14. You can use pattern matching as `assert` to check if results are correct

# Links
1. https://exercism.org/tracks/elixir/exercises/high-score
2. https://hexdocs.pm/elixir/1.15.7/Map.html#put/3
3. https://dev.to/noelworden/so-many-ways-to-update-a-map-with-elixir-1aie
4. https://exercism.org/tracks/elixir/concepts/default-arguments
5. https://stackoverflow.com/questions/40251295/add-remove-key-value-pairs-from-a-map
6. 






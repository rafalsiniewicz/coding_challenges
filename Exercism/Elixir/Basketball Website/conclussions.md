# Conclussions
1. Elixir uses **code behaviours** to provide common generic interfaces. One such common example is **Access Behaviour**
2. **Access behaviour** provides a common interface for retrieving data from key-based structures.
3. **Access behaviour** is implemented for maps and keyword lists
4. With **Access behaviour** you can access specific map value by following its name with square bracket and then use the key to retrieve the value for it
5. If key doesnt exist in map then `nil` is returned (error is not raised):
```elixir
# Suppose we have these two maps defined (note the difference in the key type)
my_map = %{key: "my value"}
your_map = %{"key" => "your value"}

# Obtain the value using the Access Behaviour
my_map[:key] == "my value"
your_map[:key] == nil
your_map["key"] == "your value"
```
6. `nil` itself implements **Access behaviour** and returns `nil` for any key, e.g.
```elixir
nil[:key] == nil
nil[:keysadfwerg] == nil
nil["key"] == nil
```
7. Pattern in `String.split/3` function has to be in double quotes `""` not in single quotes `''`
8. `Kernel.get_in/2` allows to traverse and get nested values from map:
```elixir
users = %{"john" => %{age: 27}, "meg" => %{age: 23}}
get_in(users, ["john", :age])
27
# Equivalent to:
users["john"][:age]
27
```

# Links
1. https://exercism.org/tracks/elixir/exercises/basketball-website
2. https://hexdocs.pm/elixir/Kernel.html#get_in/2

# Conclussions
1. Structs are built on top of maps in elixir
2. Structs provide compile-time checks and default values
3. Struct is named after the module it is defined in
4. To define struct use a `defstruct` construct, similarly to `defmodule`
5. The struct construct usually follows after the module definition
6. `defstruct` accepts list of atoms (`nil` values by default) or keyword list (for specified default values). The fields without defaults must precede the fiedls with values:
```elixir
defstruct [:engine, wings: 2] # ok
defstruct [wings: 2, :engine] # not ok
```
7. Since structs are based on maps, you can use maps functions to get and manipulate values
8. The access behaviour (e.g. `map[:c]`) IS NOT implemented for structs, which means you cannot access struct value by provide map name followed by key in square brackets
9. You can use **static access operator** to access struct fields:
```elixir
plane = %Plane{}
plane.engine
# => nil
Map.fetch(plane, :wings)
# => {:ok, 2}
```
10. You can update values in struct the same as in map:
```elixir
plane = %Plane{}
%{plane | wings: 4}
# => %Plane{engine: nil, wings: 4}
```
11. You can use `@enforce_keys` module attribute with a list of field keys to ensure that the values are initialized when created. It means that if the keys are not initialized during struct creation the error will be raised:
```elixir
defmodule User do
  @enforce_keys [:username]
  defstruct [:username]
end

%User{}
# => (ArgumentError) the following keys must also be given when building struct User: [:username]
``` 
12. You cant create a struct in the same context/file in which its defined, outside of any functions. You can omit this by using iex or by creating another module:
```elixir
defmodule User do
  defstruct name: "John", age: 27
end

defmodule Main do
  def main do
    john = %User{}
    IO.puts(john.name)
    IO.puts(john.age)
  end
end

Main.main
$ elixir a.exs
John
27
```
So if you want to create a structure in the same file you need to wrap it into some module
13. To update more than one value in struct use comma separator:
```elixir
s = %S{arg1: 1, arg2: 2}
%{S | arg1: s.arg1 + 5, arg2: s.arg2 + 5}
# => %S{arg1: 6, arg2: 7}
```
14. You have to update all fields AT ONCE, since you will only return the last instruction result:
```elixir
def fun(s = %S{a: a, b: b}) do
  %{s | a: s.a+1, b: s.b+1}

end
```

# Links
1. https://exercism.org/tracks/elixir/exercises/remote-control-car
2. https://hexdocs.pm/elixir/1.13.4/Access.html
3. https://stackoverflow.com/questions/39576209/elixir-cannot-access-struct
4. https://elixirforum.com/t/defstruct-diffrenet-behaviors-in-iex-and-elixir/7801/8
5. 

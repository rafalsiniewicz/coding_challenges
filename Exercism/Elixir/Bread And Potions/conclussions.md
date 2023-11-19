# Conclussions
1. **Polymorpshism** is a concept of many types from the same interface. Each type can provide its own independent implementation of this interface
2. There are 2 types of polymorphism reagarding choosing implementation:
- **static polymorphism** - implementation is chosen during compilation, e.g. functions with the same name but different set of parameters
- **dynamic polymorphism** - implementation is chosen during run time (typically via virtual function)
3. **Protocols** are mechanisms to achieve polymorpism in elixir. 
4. You can use Protocols if you want different functionality/implementation for different types
5. Protocols are defined using `defprotocol` and contain one or more function headers:
```elixir
defprotocol Reversible do
  def reverse(term)
end
```
6. Protocols implementation are defined with `defimpl`:
```elixir
defimpl Reversible, for: List do
  def reverse(term) do
    Enum.reverse(term)
  end
end
```
7. Protocol can be implemented for any data type or for a struct
8. When a protocol function is invoked, the appropriate implementation gets automatically chosen based on the type of the first argument (static polymorphism???)
9. You can define your own type with `@type <name>() :: <type>`. Most often it will look like below:
```elixir
defmodule A do
  @type t() :: integer | String.t()
end

defmodule B do
  @spec fun(A.t()) :: :ok
  def fun(a) do
    IO.puts("hello")
    :ok
  end
end
```


# Links
1. https://exercism.org/tracks/elixir/exercises/bread-and-potions
2. https://elixirschool.com/pl/lessons/advanced/typespec
3. https://hexdocs.pm/elixir/1.12/typespecs.html
4. https://elixirschool.com/en/lessons/advanced/typespec

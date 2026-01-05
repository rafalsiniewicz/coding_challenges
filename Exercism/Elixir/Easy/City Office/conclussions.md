# Conclussions
## Docs
1. Documentation in elixir is a first-class citizen, meaning documentation in elixir is taken with the same importance as other language features
2. There are 2 module attributes used to document the code:
- `@moduledoc` for documenting the module
- `@doc` for documenting a function that follows the attribute
3. The `@moduledoc` usually appears on the first line of the module
4. The `@doc` usually appears right before a function definition or a function typespec if it has one
5. Elixir documentation in written in markdown

## Typespecs
1. Elixir is a dynamically typed language, which means it doesnt provide compiler-time type checks. Still, type specifications can be used as a form of documentation.
2. Type specification can be added to function using `@spec` module attribute right before function definition
3. `@spec` is followed by the function name and a list of all its args types, in parenthesses, separated by commas. The type of return value is separated by double colon `::`, e.g.:
```elixir
@spec longer_than?(String.t(), non_neg_integer()) :: boolean()
def longer_than?(string, length), do: String.length(string) > length
```
4. Most commonly used types include:
- boolean()
- String.t()
- integer(), non_neg_integer(), pos_integer(), float()
- list()
- any()
5. Some types can also be parametrized, e.g. `list(integer)` means a list of integers
6. Literals (atoms) also can be types.
7. A union of types can be written using the pipe `|`. For example, `integer() | :error` means either an integer or the atom literal `:error``.
8. Arguments in the typespec could also be named which is useful for distinguishing multiple arguments of the same type. The argument name, followed by a double colon, goes before the argument's type:
```elixir
@spec to_hex({hue :: integer, saturation :: integer, lightness :: integer}) :: String.t()
```
9. Custom types can be defined using the `@type` module attribute. A custom type definition starts with the type's name, followed by a double colon and then the type itself, e.g.
```elixir
@type color :: {hue :: integer, saturation :: integer, lightness :: integer}

@spec to_hex(color()) :: String.t()
```
10. A custom type can be used from the same module where it's defined, or from another module.
11. To define tuple in spec use:
```elixir
@spec fun(a :: integer) :: tuple() # tuple of any size
@spec fun(a :: integer) :: {:error, type} # two-element tuple with an atom and any type
```
12. To define map in spec use:
```elixir
@spec foo(%{required(String.t()) => String.t()}) :: nil # All keys and values must be strings. Will accept an empty map.
@spec foo(%{:street => String.t(), :postal_code => String.t(), :city => String.t()}) # map with 3 keys: :street, :postal_code, :city with values of type string
```

# Links
1. https://exercism.org/tracks/elixir/exercises/city-office
2. https://hexdocs.pm/elixir/1.13/typespecs.html
3. http://crevalle.io/maps-in-typespecs.html






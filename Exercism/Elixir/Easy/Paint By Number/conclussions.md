# Conclussions
## Bitstrings
1. In elixir binary data is reffered to as a bitstring type
2. Bitstring literals are defined via `<<>>`
3. Bitstrings are defined in segments. Each segment has a value and type separated by `::` operator:
```elixir
<<value::type>>
```
4. The type specifies how many bits will be used to encode the value. Type can be omitted, which will default to 8-bit integer value:
```elixir
# This defines a bitstring with three segments of a single bit each
# b'010
<<0::1, 1::1, 0::1>>
```
5. Type can be specified either by integer or with `size()`, e.g:
```elixir
x = 5
<<1::2>> # size = 2
<<1::size(3)>> # size = 3
<<1::size(x)>> # size = 5
```
## Binary
1. To write integer in base-2 notation use `0b` prefix:
```elixir
<<0b1011::4>> == <<11::4>>
# => true
```
## Truncating
1. If the value of the segment overflows the capacity of its type, it will be truncated from the left (MSB):
```
<<0b1011::3>> == <<0b0011::3>>
# => true
```
## Prepending and appending
1. You can both prepending and appending to existing bitstring. The `::bitstring` must be used on existing bitstring if it's of unknown size:
```elixir
value = <<0b110::3, 0b001::3>>
new_value = <<0b011::3, value::bitstring, 0b000::3>>
# => <<120, 8::size(4)>>
```
## Concatenating
1. Concatenating is similar to prepending/appending:
```elixir
first = <<0b110::3>>
second = <<0b001::3>>
concatenated = <<first::bitstring, second::bitstring>>
# => <<49::size(6)>>
```
## Pattern matching
1. `::bitstring` can be used only for the last fragment:
```elixir
<<value::4, rest::bitstring>> = <<0b01101001::8>>
value == 0b0110
# => true
```
## Others
1. By default bitstrings are displayed in fragments of 8 bits:
```elixir
<<2011::11>>
# => <<251, 3::size(3)>>
```
2. If you create a bitstring that represents UTF-8 string, it will be displayed as a string:
```elixir
<<>>
# => ""

<<65, 66, 67>>
# => "ABC"
```
so it works kind of similarly as charlist
3. There are `Kernel` arithmetic functions, e.g. `Kernel.+/1` or `Kernel.+/2`

# Links
1. https://exercism.org/tracks/elixir/exercises/paint-by-number
2. https://elixirforum.com/t/arithmetic-operators-with-pipe-operator/3580






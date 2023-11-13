# Conclussions
1. Ranges in elixir represent sequence of one or many **consecutive** integers. 
2. Ranges are created by connecting two integers with two dots: `..`:
```elixir
1..5
```
3. Ranges can be ascending or descending
4. Ranges are inclusive on both sides, e.g. `1..3` means set of numbers: {1,2,3}
5. Range **implements** the `Enumerable` protocol (which means protocol is something like interface in elixir). It means that ranges can use functions from `Enum` module
6. You can get numerical value of char (ascii value) in few ways:
```elixir
>> ?A
# => 65

>> "A" |> String.to_charlist |> hd
# => 65

>> var = "a"
# => "a"
>> <<v::utf8>> = var
# => "a"
>> v
# => 97
```
7. To change character codepoint (ascii value) to a string you can use `<<char>>`:
```elixir
# use:
<<?A>>
# => "A"
```
OR:
```elixir
List.to_string([97, 98, 99])
"abc"
```

# Links
1. https://exercism.org/tracks/elixir/exercises/chessboard
2. https://elixirforum.com/t/get-ascii-value-of-a-character/16619/2

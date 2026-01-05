# Conclussions
1. `<<>>` operators are for defining bitstrings
2. Binaries (in contrary to bitstrings) have to be a multiplication of 8 bits (byte). Whereas bistrings can be of any bit length.
3. Binary literals are defined with `<<>>` 
4. Integer greater than 255 will overflow and only 8 LSB of integer will be used
5. We can concatenate binaries with `<>/2` operator
6. By default `::binary` modifier is applied to value
7. A null-byte is another name of `<<0>>`
8. To pattern match any binary remember about the rest of binary value, e.g.
```elixir
# match first 3 bytes
<<0x6, 0xf1, 0x2, _rest::binary>> = <<0x6, 0xf1, 0x2, 0x5, 0x6, 0x9, 0x12>>
# => _rest is equal to <<0x5, 0x6, 0x9, 0x12>>

# match last 2 bytes
<<_rest::binary, 0x4, 0x5>> = <<0x6, 0xf1, 0x2, 0x5, 0x6, 0x4, 0x5>>
# => _rest is equal to <<0x6, 0xf1, 0x2, 0x5, 0x6>>
``` 

# Links
1. https://exercism.org/tracks/elixir/exercises/file-sniffer

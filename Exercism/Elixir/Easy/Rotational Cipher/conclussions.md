# Conclussions
1. `to_string/1` is the func which you can use to convert charlist to string (not only charlist, atoms too, and other types which implement `String.Chars` protocol)
2. Elixir doesnt have `else if` statements
3. List of numbers from 32 to 126 is interpreted as charlist in elixir (ASCII numbers of symbols, other ASCII numbers are not interpreted to charlist)
4. -/+ operations on numbers with modulo for some before last modulo will result in the same as just last modulo, i.e.
```elixir
(14 + 12) modulo 5 = 26 modulo 5 = 1
((14 modulo 5) + (12 modulo 5)) modulo 5 = (4 + 2) modulo 5 = 6 modulo 5 = 1
((14 modulo 5) + 12) modulo 5 = (4 + 12) modulo 5 = 16 modulo 5 = 1
(14 + (12 modulo 5)) modulo 5 = (14 + 2) modulo 5 = 16 modulo 5 = 1
```
so just doing modulo once at the end is lowest effort


# Links
1. https://exercism.org/tracks/elixir/exercises/rotational-cipher

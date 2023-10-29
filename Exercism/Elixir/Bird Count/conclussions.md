# Conclussions
1. Strings in elixir are delimited/created with double quotes and are encoded in UTF-8, e.g. `"Example string"`
2. Strings can be concatenated using `<>/2` operator, e.g. `"Hi," <> " " <> "my name is" <> " " <> "Rafal"`, which would produce: `"Hi, my name is Rafal"` string
3. Strings in elixir supports interpolation using `#{}` syntax, e.g.:
```elixir
"6 * 7 = #{6 * 7}"
# => "6 * 7 = 42"
```
4. `\n` is used for newline (same as in other languages)
5. To work comfortably with many lines texts use "triple-double-quote" heredoc syntax, e.g.:
```elixir
"""
1
2
3
"""
```
6. Elixir provides many functions for working with strings in the `String` module
7. Pipe operator is denoted with `|>`. Pipe operator can be used to chain function calls together in a way that the value returned by the previous function call is passed as the first argument to the next function call (similarly as `>` operator in bash in bash), e.g.:
```elixir
"hello"
|> String.upcase()
|> Kernel.<>("?!")
# => "HELLO?!"
```
8. To access particular element from list you can use `[head | tail]` pattern matching, e.g.:
```elixir
[head | tail] = [1,2,3,4]
head
# => 1
tail
# => [2,3,4]
```
9. You can use `first\1` and `last\1` functions from `List` module to access first/last element in list
10. To get n-th char of string use `String.at(str, n)` function
11. To split string into a list of strings by some pattern use `String.split\3` function.
12. To remove all leading and trailing whitespaces from string use `String.trim\1`

# Links
1. https://exercism.org/tracks/elixir/exercises/high-school-sweetheart
2. https://hexdocs.pm/elixir/1.15.7/List.html
3. https://hexdocs.pm/elixir/1.15.7/String.html







# Conclussions
1. Regular expressions in elixir follow PCRE specification (Perl compatible regular expressions), similarly to other languages, such as: Java, JavaScript and Ruby
2. `Regex` module offers functions for working with regular expressions.
3. Some of `String` module functions accept regexes as arguments
### Sigils
4. The most common way to create regular expressions is to use the `~r` sigil:
```elixir
~r/test/
```
5. Elixir supports different kinds of delimiters, not only `/`. It could be e.g. `{`, `<`, `"`, `[`, etc. 
### Matching
6. The `=~/2` operator can be used to perform regex match that returns `boolean` result. Also there are `match?/2` functions in `Regex` and `String` module which do the same:
```elixir
"this is a test" =~ ~r/test/
# => true

String.match?("Alice has 7 apples", ~r/\d{2}/)
# => false
```
### Capturing
7. If a boolean check is not enough use the `Regex.run/3` function to get a list of all captures (or `nil` if there was no match). The first element in the returned list is always a match for the whole regular expression and the following elements are matched groups:
```elixir
Regex.run(~r/(\d) apples/, "Alice has 7 apples")
# => ["7 apples", "7"]
```
8. To group results in regex use parentheses `()`, e.g. `~r/(\d) (test) (\d{4})/` which for example string: `Hi, i have 5 numbers for your test. Each number contains 1234 digits` we will have following matched groups: `["5", "test", "1234"]`
### Modifier
9. The behaviour of regular expression can be modified by appending special flags. When using sigil to create regular expression, add the modifiers after the second delimiter.
10. Common modifiers:
- `i` - makes the match case-insensitive:
  ```elixir
  "this is a TEST" =~ ~r/test/i
  # => true
  ```
- `u` - enables Unicode specific pattern, like `\p` and causes character classes like `\w`, `\s`, etc. to also match Unicode
11. To have tilde/sigil without clicking it twice in windows, click it once and then space. Clicing Sigil/tilde once and then
some letter, e.g. "n" gives you special unicode letter like "ń"
12. You can use `Regex.split/3` function to split a string by regex pattern and return list of substrings

# Links
1. https://exercism.org/tracks/elixir/exercises/log-parser
2. https://hexdocs.pm/elixir/syntax-reference.html#sigils
3. https://www.reddit.com/r/windows/comments/qklx7w/why_do_i_have_to_type_twice_to_get_the_tilde_on/
4. https://hexdocs.pm/elixir/Regex.html#run/3









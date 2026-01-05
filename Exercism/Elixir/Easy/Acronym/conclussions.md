# Conclussions
1. You can use regexes to split string into a list of strings. `String.split(string, ~r/some_regex_here/)`
2. Instead of regex you can also write manually all characters which should split a string, e.g. `String.split(string, [",|, " ", "|"])`
3. Regex sign for whitespace is `\s`
4. Regex sign for one or more is `+`
4. Regex sign for punctuation signs is `\p{P}` or if your regex doesnt support it you can use `[^\w\s]+` which will negate all words and whitespaces

# Links
1. https://exercism.org/tracks/elixir/concepts/regular-expressions







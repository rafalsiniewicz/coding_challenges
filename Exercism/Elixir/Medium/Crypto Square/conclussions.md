# Conclussions
1. Elixir func for downcase string is `String.downcase/2`
2. Sometimes calling a funcs which are doing sth during runtime instead of doing sth at compile time can help you avoid 
`"** (ArgumentError) cannot escape #Reference<0.3612241767.1662124034.255201>. The supported values are: lists, tuples, maps, atoms, numbers, bitstrings, PIDs and remote functions in the format &Mod.fun/arity"` error, e.g. instead of:
```elixir
String.replace("Hello, world!", ~r/[[:punct:]]/, "")
```
use `Regex.compile` which takes string and only calcs it during runtime:
```elixir
String.replace("Hello, world!", Regex.compile("[[:punct:]]"), "")
```

# Links
1. https://exercism.org/tracks/elixir/exercises/crypto-square







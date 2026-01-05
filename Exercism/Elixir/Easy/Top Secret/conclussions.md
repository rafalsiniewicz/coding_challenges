# Conclussions
1. Abstract syntax tree (AST) is a way to represent code as data
2. AST is also called *quoted expression* 
3. Each node in AST is a 3 element tuple:
```elixir
# AST representation of:
# 2 + 3
{:+, [], [2, 3]}
```
- The first element, an atom is operation
- Second element, a keyword list is metadata
- Third argument is a list of arguments, which contains other nodes
4. Literal values, such as: integers, atoms and strings are represented in AST as themselves instead of three-elements tuples (example above)
5. Standard library has functionality to change elixir code to AST and reverse- changing AST to elixir code
6. Functions for working with AST can be found in modules: 
- `Code`, e.g. to change string with code to AST
- `Macro`, e.g. to traverse an AST or create a string from it
7. All functions in standard library use the name "quoted" to mean the AST (short for *quoted expression*)
8. The special form to turn code into AST is called `quote`. It accepts a code block and returns its AST:
```elixir
quote do
  2 + 3 - 1
end

# => {:-, [], [
#      {:+, [], [2, 3]},
#      1
#    ]}
```
9. Ability to represent elixir code as AST is the basis of metaprogramming in elixir. 
10. *Macros* is the way of writing elixir code that produces elixir code, works by returning ASTs as output
11. Another use of AST is static code analysis, e.g. `mix credo`, `mix dialyzer`
12. To remove all whitespaces from string use `String.replace/3` function. With it you can 
replace all `" "` to `""`
13. To convert string to AST use `Code.string_to_quoted` function
14. To convert AST to string use `Macro.to_string` function
15. Its good to use recursion during traversing an AST. Traverse tree via its args, i.e. tree is nested 
inside its args
16. `String.slice/3` is different from `String.slice/2` because range is both sides closed. `String.slice/3`
slices to `n` length, starting from `start`, which means for `n = 3` and `start = 0` we would get first 3
letters of string. For `String.slice/2`, which uses range, we would get first 4 letters for range `0..3`, 
because if both sides included. Also with `String.slice/3` you can get an empty string and with range
its not possible (youll get at least one letter, e.g. for range `0..0`)
17. Use `Macro.prewalk` function to traverse through AST. You can then asses each node in tree and e.g.
tell if its function or something else
18. Capture operator `&` can be used to get function, e.g. for `Enum.map` function:
```elixir
defmodule Module do
  def fun(x), do: x + 1
end

Enum.map([1,2,3], &Module.fun/1)
# => [2,3,4]
```

# Links
1. https://exercism.org/tracks/elixir/exercises/top-secret
2. https://stackoverflow.com/questions/75681659/in-elixir-how-do-i-remove-all-whitespace-from-a-string
3. https://hexdocs.pm/elixir/Code.html#string_to_quoted/2
4. https://hexdocs.pm/elixir/main/Macro.html#to_string/1

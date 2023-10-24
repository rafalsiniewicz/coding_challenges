# Conclussions
1. Tuples are a data structures to store one or more elements. Tuples are imutable
2. Tuples in elixir are defined with `{}` parentheses
3. `elem/2` function with 0-based indexing allows to access tuple elements:
```elixir
multiple_element_tuple = {1, :a, "hello"}

elem(multiple_element_tuple, 2)
# => "hello"
```
4. Pattern matching is important elixir feature, commonly and highly used. It allows to created named functions and differentiate between same-named-functions basing on arguments matching.
5. Pattern matching operator is the same as assigning/equal operator: `=`, e.g.:
```elixir
2 = 2
# => 2
# Literals can be matched if they are the same

2 = 3
# => ** (MatchError) no match of right hand side value: 3
```
6. **IMPORTANT! When using the match operator, if the pattern on the left matches the right, any variables on the left are bound, and the value of the right side is returned:**
```elixir
{_, denominator} = Float.ratio(0.25)
# => {1, 4}
# the variable `denominator` is bound to the value 4
```
If we don't need a variable in a pattern match, we can discard it by referencing `_`. Any variable starting with an `_` is not tracked by the runtime.
7. **IMPORTANT! Remember, matches occur from the right side to the left side., e.g:**
```elixir
a = {_, denominator} = Float.ratio(0.25)
# variable `a` equals {1, 4}
# variable `denominator` equals 4
```

# Links
1. https://exercism.org/tracks/elixir/exercises/kitchen-calculator/edit




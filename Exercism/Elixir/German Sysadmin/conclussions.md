# Conclussions
## Charlists
1. Charlists are created using `~c` syntax:
```elixir
~c"hello"
```
2. Although they look very similar to strings, the two data types are quite different from one another. A charlist is a list of integers. The integers represent the Unicode values of a given character — also known as code points:
```elixir
[65, 66, 67]
# => ~c"ABC"
```
3. You can get a code point of char by prepending `?` to it:
```elixir
?A
# => 65

[?:, ?)]
# => ~c":)"
```
4. Since charlists are just list you can work with them as with any other list- using recursion and pattern matching:
```elixir
[first_letter | _] = ~c"cat"
first_letter
# => 99
```
5. You can concatenate two lists using `++`:
```elixir
~c"hi" ++ ~c"!"
# => ~c"hi!"
```
## Case
1. `case` allows to compare a given value against many patterns. Clauses in `case` are evaluated from top to bottom, until a match is found:
```elixir
age = 15

case age do
  0 -> ~c"infant"
  age when age < 4 -> ~c"baby"
  age when age < 13 -> ~c"child"
  age when age < 18 -> ~c"teenager"
  _ -> ~c"adult"
end

# => ~c"teenager"
```
## Others
1. If you want to use equivalent of `for` loop you need to use recursion, e.g. instead of:
```elixir
a = 1
for (i=1, i<5, i++)
{
  a *= i
}
```
use:
```elixir
def fun(a, 1) do
  a * 1
end

def fun(a, i) do
  i = i - 1
  i * fun(a, i)
end
```

# Links
1. https://exercism.org/tracks/elixir/exercises/german-sysadmin
2. https://stackoverflow.com/questions/21075026/what-is-the-difference-between-cond-and-case
3. https://inquisitivedeveloper.com/lwm-elixir-23/
4. 






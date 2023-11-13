# Conclussions
1. While recursing through enumerables (lists, bitstrings, strings, charlists) you should concern 2 things mainly:
- how much memory is required to store the trail of recursive function calls
- how to create efficient solutionn\
To deal with those concerns **accumulator** can be used
2. **Accumulator** is a variable that is passed along to function calls, except the data, e.g.:
```elixir
# no accumulator
fun(list), do: 1 + fun(list) 
# with accumulator
fun(list), do: fun2(list, 0)
defp fun2(list, n), do: n
defp fun2(list, n), do: fun2(list, n + 1)
```
3. **Accumulator** is used to pass the current state of function's execution, from function call to function call until the base case is reached. In the base case accumulator is used to return the **final** value of the recursive function call
4. Accumulators should be private functions, since they should be initialized by function's author, not user
5. In elixir it is common practice to prefix the private function's name with `do_`
6. `::binary` is for byte-length values (exactly 8 bits), `::bitstring` is for every length values, e.g. 4 bits, 5 bits, etc.
7. All binaries are bitstrings, but not all bitstrings are binaries!!!

# Links
1. https://exercism.org/tracks/elixir/exercises/dna-encoding
2. https://hexdocs.pm/elixir/1.16/binaries-strings-and-charlists.html
3. https://exercism.org/tracks/elixir/concepts/bitstrings






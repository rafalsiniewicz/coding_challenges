# Conclussions
1. `Integer.pow/2` can be used to calculate power of base to the power
2. To preserve integer and not scientific notation of number while divisioning use `div/2` instead of `/`, e.g.
```elixir
>> 1-Integer.pow(2, 64) / (1-2)     # 1.8446744073709552e19
>> div(1-Integer.pow(2, 64), (1-2)) # 18446744073709551615
```


# Links
1. https://exercism.org/tracks/elixir/exercises/grains







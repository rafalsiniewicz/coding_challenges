# Conclussions
1. To call anonymous func passed as arg you need to write its name and dot and parenthesses with optional arg inside, e.g.:
```elixir
def func(func_arg) do
    # calling func with no args, i.e. func_arg/0
    func_arg.()
    # calling func with args, i.e. func_arg/2
    func_arg.(1, 2)
end
```

# Links
1. https://exercism.org/tracks/elixir/exercises/strain
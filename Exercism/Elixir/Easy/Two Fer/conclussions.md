# Conclussions
1. Sometimes you can just use default value for function arg instead of creating another clause. In case of this exercise you could use `you` as default value in `name` arg instead of creating 2 clauses, like:
```elixir
def two_fer() do
    # some code
end

def two_fer(name) do
    # some other code
end
```
you can just do:
```elixir
def two_fer(name \\ "you") do
    # some code
end
```
so you can use `name` arg in both cases, instead of creating separate clause


# Links
1. 






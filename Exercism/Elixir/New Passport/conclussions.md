# Conclussions
1. `with` keyword in elixir allows to focus on successfull path of a series of potentially failing steps and deal with a failures later.
2. Example of `with` usage:
```elixir
with {:ok, id} <- get_id(username),
     {:ok, avatar} <- fetch_avatar(id),
     {:ok, image_type} <- check_valid_image_type(avatar) do
  {:ok, image_type, avatar}
else
  :not_found ->
    {:error, "invalid username"}

  {:error, "not an image"} ->
    {:error, "avatar associated to #{username} is not an image"}

  err ->
    err
end
```
At each step if clause matches, the chain will continue until the `do` block us executed. If the one match fails, the chain stops and the non-matching clause is returned. You can use `else` block to catch failed matches and modify the return value
3. Each call in `with` should be separated by a comma `,`
4. You can perform calculations in a `with` statement, like:
```elixir
with ret_fun1 <- fun1(arg1),
     ret_val1 <- ret_fun1.(arg2),
     ret_val2 <- fun2(ret_val1) do
```
5. Order of clauses is really important, theyre always run from top to bottom (same order as for checking which function clause run). So if you have clause which pattern match everything, you should probably place it at the bottom

# Links
1. https://exercism.org/tracks/elixir/exercises/new-passport
# Conclussions
1. `Agent` module facilitates (makes easier, allows) abstraction for spawning processes and receive-send loop
2. An agent process can be chosen to represent a central shared state
3. `Agent.start/2` allows to start agent process. The function provided for the function returns initial state of a process:
```elixir
# Start an agent process with an initial value of an empty list
{:ok, agent_pid} = Agent.start(fn -> [] end)
```
4. Commonly the `Agent` related functions are organized and wrapped inside customized modules for the domain which is programmed, e.g. agent processes for client-server connection, etc.
5. Collection in elixir means enumrable (e.g. list) of elements
6. To use `Agent` module inside your own module you need to put `use Agent` in the module:
```elixir
defmodule CommunityGarden do
  use Agent

  def start(opts \\ []) do
    Agent.start(fn -> [] end, opts)
  end
end
```
7. To get last elem of list use `List.last/1` function
8. To merge two lists use `++` operator for lists, e.g. `merged = list1 ++ list2`
9. You can pass aditional values in `Agent` processes, which will server e.g. as helpers for passed state, e.g. it can be a counter
10. You can prepend to list by using `[head | tail]` syntax:
```elixir
a = [1,2,3]
b = [0 | a]
# => [0,1,2,3]
```
11. Keyword lists (`[k1: v1, k2: v2]`) are good for storing states, e.g. the state of `Agent` processes


# Links
1. https://exercism.org/tracks/elixir/exercises/community-garden
2. https://hexdocs.pm/elixir/1.15.7/Agent.html#get/3
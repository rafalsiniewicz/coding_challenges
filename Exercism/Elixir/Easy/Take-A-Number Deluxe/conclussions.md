# Conclussions
1. `GenServer` (generic server) is **behaviour** that abstracts common client-server interactions between elixir processes
2. `GenServer` provides abstractions for implementing receive loop, exchanging messages with process that runs such loop. It makes it easier to keep state and execute/manage asynchronous code
3. `GenServer` behaviour defines one required callback, `init/1`
4. `GenServer` behaviour defines a few optional callbacks:
    - `handle_call/3`
    - `handle_cast/2`
    - `handle_info/3`
5. The clients using `GenServer` do not need to call those its callbacks directly. `GenServer` provides functions that clients can use to communicate with `GenServer` process
6. Often a single module defines both: a client API (functions for other modules to communicate with `GenServer`) and server callback implementations which contains `GenServer` logic
### Example of GenServer
```elixir
defmodule AnnoyingPassengerAutoresponder do
  use GenServer
  # Client API

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def are_we_there_yet?(pid) do
    GenServer.call(pid, :are_we_there_yet?)
  end

  # Server callbacks

  @impl GenServer
  def init(_init_arg) do
    # the initial count of questions asked is always 0
    state = 0
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:are_we_there_yet?, _from, state) do
    reply =
      cond do
        state <= 3 -> "No."
        state <= 10 -> "I told you #{state} times already. No."
        true -> "..."
      end

    # increase the count of questions asked
    new_state = state + 1
    # reply to the caller
    {:reply, reply, new_state}
  end
end
```
7. `init/1`:
    - Server can be started by calling `GenServer.start/3` or `GenServer.start_link/3`. Those two functions:
        - accept a module implementing `GenServer` behaviour as a first argument (`__MODULE__` in the example)
        - accept anything as 2nd argument called `init_arg`. This argument is passed then to `init/1` callback
        - accept an optional 3rd argument with advanced options for running the process
    - Starting a server with `GenServer.start/3` or `GenServer.start_link/3` will invoke `init/1` callback in a blocking way (it can go further or stop during `init/1` running). The returning value of `init/1` will decide if server will start or stop:
        - `{:ok, state}` - the server will start its receive loop using `state` as its initial state. `state` can be of any type (e.g. tuple as in example above)
        - `{:stop, reason}` - the server will not start its receive loop. The process will exit with the given reason. `reason` can be of any type
    - If server's receive loop starts, the functions `GenServer.start/3` or `GenServer.start_link/3` will return `{:ok, pid}` tuple. Otherwise they return `{:error, reason}` tuple
8. `handle_call/3`:
    - a message that requires a reply can be sent to a server process with `GenServer.call/2`
    - `GenServer.call/2` requires `pid` of a running server process as the first argument and the message as the second argument. The message can be of any type
    - `handle_call/3` callback is responsible for handling and responding to synchronous messages. It receives 3 arguments:
        - `message` - the value passed as 2nd argument of `GenServer.call/2`
        - `from` - the pid of the process calling `GenServer.call/2`. Most often this argument can be ignored
        - `state` - the current state of the server. Remember that server's initial state was set in `init/1` 
    - The `handle_call/3` callback usually returns a 3 tuple of `{:reply, reply, state}`:
        - `reply`, a 2nd argument of this tuple can be of any type. It will be sent back to the caller
        - 3rd element in the tuple, `state`, is the new state of the server after handling this message 
    - `handle_call/3` can be memorized/thinked of as calling someone over a mobile phone. Our message will be received immediately and we expect a response immediately (asynchronous)
9. `handle_cast/2`:
    - a message that doesnt require a reply can be send to a server's process with `GenServer.cast/2`. First arg is pid of running server process and second is message send to the server
    - `handle_cast/2` callback is responsible of handling messages send through `GenServer.cast/2`. It receives 2 args: `message` and `state`, which are the same arguments as in `handle_call/3` (except for `from`)
    - `handle_cast/2` usually returns a 2 tuple of `{:noreply, state}` 
    - you can think of `handle_cast/2` as of a message for which you dont expect reply, such as sending a bottle message to the ocean
10. Almost always you would want to use `call` instead of `cast`, even if your code doesnt expect reply from a server. Using `call` waits for reply, which serves as a backpressure mechanism (to not let clients sending too many messages at once, they will still be run synchronously). Receiving a reply from server is also the only way to be sure that the server received and handled the clients message
11. `handle_info/2`:
    - Messages can also end up in servers inbox by means other than `call` or `cast`, for example by calling the simple `send/2`. To handle such messages use `handle_info/2` callback
    - This callback works exactly the same as `handle_cast/2` 
    - the `GenServer` behaviour provides a catch-all default implementation of `handle_info/2` that logs errors about unexpected messages. If you'll overwrite this default implementation make sure to always include your own catch-all implementation. If you wont, then server will crash if it receives an unexpected message (so just implement your own `def handle_info(pid, message)` which will run for any type/value of message) 
12. Timeouts:
    - the return value of all 4 above callbacks can be extended by one more element, a timeout, e.g. instead of returning `{:ok, state}` from `init/1` we can return `{:ok, state, timeout}`
    - the timeout can be used to detect lack of messages in the inbox of server for specified period
    - if the server returns a timeout from one of its callbacks and the specified number of milliseconds have elapsed with no message arriving, then `handle_info/2` is called with `:timeout` as the first argument (instead of pid)
13. IMPORTANT!!! To use functions from other modules you need to compile those modules, e.g.
you have files `a.exs` and `b.ex` with modules inside respectively `A` and `B`, then to use module `B` in `A` you need to:
> elixirc b.ex

only then you can:
> elixir a.exs

# Links
1. https://exercism.org/tracks/elixir/exercises/take-a-number-deluxe
2. https://hexdocs.pm/elixir/processes.html
3. https://elixirforum.com/t/handling-multiple-elixir-files/9305/2
4. https://hexdocs.pm/elixir/GenServer.html#c:handle_call/3









# Conclussions
## Processes
1. In elixir all code runs inside processes
2. By default functions execute in the same process from which they were called. To explicitly run a function in a different process use `spawn/1`:
```elixir
spawn(fn -> 2 + 2 end)
# => #PID<0.125.0>
```
3. `spawn/1` creates a new process which executes given function and returns process id (PID). The new process will be alive during function execution and then silently exits
4. IMPORTANT!!! Elixir processes ARE NOT operating system processes. Elixir's processes use much less memory and CPU. You can have hundreds of elixir processes and it will run completely fine
## Messages
5. Elixir processes DO NOT share information. Thus processes send and receive **messages** to share data
6. To send message to any process use `send/2` function. First argument is PID of recipient and 2nd arg is message
7. Message can be of any type (string, atom, tuple)
8. To be able to get a response you need to include sender PID somewhere in the message. You can get a PID of the current process with `self()`
9. `send/2` DOES NOT check if message was received by other process, nor if the recipient is still alive. So you cant be sure by just using `send/2` if the message was successfully received
10. The message end ups in receiver mailbox and is read if recipient explicitly asks to receive messages
11. To read a message use `receive/1` macro. It accepts `do` block that can pattern match messages. It works similarly as in `case` code:
```elixir
receive do
  {:ping, sender_pid} -> send(sender_pid, :pong)
  :do_nothing -> nil
end
```
12. `receive/1` takes one message from mailbox that matches any of clauses/patterns and executes code after that pattern. If there are no messages in mailbox or none matches pattern then `receive/1` will wait for one
13. If you want to receive many messages you need to use recursion function with `receive/1`, e.g. function that calls `receive/1`, do something with message and then calls itself to wait for more messages. If you want to keep some state from one message to other then add another argument for it in your function
## PIDs
1. PIDs are their own datatypes. They function as mailbox addresses.
2. PIDs are often created indirectly, e.g. by `spawn/1` function
3. If youll create a process which just runs some function, which ends up quickly, the process will be dead soon, so it wont be able to receive any messages
## Others
1. You cannot increment variable value, you need to use recursion to return updated value
2. You can use parentheses/newline for multi-line code, e.g.:
```elixir
Enum.map(0..2, fn i ->
  IO.puts "I'm working on:"
  IO.puts i
  IO.puts ""
end)
```
3. To declare private function add "p" after def:
```elixir
defp fun1() do: 1, end
```



# Links
1. https://exercism.org/tracks/elixir/exercises/take-a-number
2. https://hexdocs.pm/elixir/1.15.7/Kernel.html#spawn/1
3. https://elixir-lang.org/getting-started/processes.html
4. https://elixirforum.com/t/understanding-sending-messages-to-processes/35977
5. https://gist.github.com/squarism/ad9053790d025a158aab0c899e82ea8e#file-multiline-exs-L25
6. https://stackoverflow.com/questions/39704772/elixir-receive-message-how-do-i-run-multiple-statements







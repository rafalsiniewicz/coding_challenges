# Conclussions
1. Elixir processes are isolated and dont share anything by default.
2. Processes (in general in computer science) are instances of running programs, which do not share data, sources, etc. Threads on the other hand are within one process and share data, sources, etc.
3. When unlinked child process crashes, its parent process is not affected
4. In elixir you can link one process to another
5. If two processes are linked, a failure in one process will be propagated to the other process. Links are **bidirectional**, which means linked process are simetrically "seeing" each other
6. Process can be spawned and already linked to the calling process by using `spawn_link/1`, which is an atomic operation or they can be linked later with `Process.link/1`
7. Linking processes can be really useful when doing parallel tasks when each trunk of work shouldnt be continued if another chunk fails to finish
### Trapping exits
8. Linking can also be used for **supervising processes**. 
9. If a process **traps exit** it means that it wont crash if linked process crash, but instead it will receive a message about a crash. This allows to deal with crashes more smoothly, e.g. by restarting the failed process
10. Process can be configured to trap exits by calling `Process.flag(:trap_exit, true)`. (Note that `Process.flag/2` returns the old value of flag, not new)
11. The message that will be sent to process in case when linked process crashes will match the pattern `{:EXIT, from, reason}`, where `from` is a PID. If `reason` is anything other than atom `:normal` that means that process crashed or was forcefully killed
### Tasks
12. Tasks are processes which execute one specific operation
13. Usually tasks dont communicate with other processes, but they can return a result to the process that started it.
14. Tasks are **commonly used to parallelize work**
15. To start a `Task` use `Task.async/1`, which takes anonymous function (lambda function) as an arg and executes it in a new process that is linked to the caller process.
16. `Task.async/1` returns a `%Task{}` struct
17. To get a result of task execution pass the `%Task{}` struct to `Task.await/2` function. It will wait for task to finish and return its result. The second argument is a timeout in milliseconds (by default = 5000)
18. NOTE the between starting task and awaiting its finishing, the caller process is not blocked and might do other operations in parallel
19. Any task started with `Task.async/1` should be awaited because it will send a message to the caller process.
20. `Task.await/2` can be called only once per task
21. If you want to start a task for side effects only, use `Task.start/1` or `Task.start_link/1` 
22. `Task.start/1` starts a task that is not linked to the calling process
23. `Task.start_link/1` starts a linked process with task.
24. Both `Task.start/1` and `Task.start_link/1` return `{:ok, pid}` tuple
25. You can update map in elixir by using: `%{map | one: "one"}` syntax
26. You can use `Enum.reduce` to do some operation on every element of iterable and store the result in accumulator
27. Use pin operator `^` to get a value of already defined variable in pattern match operation
28. Remember that starting all tasks first and then waiting for all tasks to finish will be much faster than doing it one by one, like first task start, waiting to finish, 2nd task start, waiting to finish... it takes too much time, starting all at once and waiting for all at once is much faster
29. `tap/2` passes the value to the function and returns the value

# Links
1. https://exercism.org/tracks/elixir/exercises/rpn-calculator-inspection
2. https://hexdocs.pm/elixir/Kernel.html#spawn_link/1
3. https://hexdocs.pm/elixir/1.12/Map.html
4. https://hexdocs.pm/elixir/1.15/Enum.html


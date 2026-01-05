# Conclussions
1. `File` module provides functions to work with files
2. To read a file use `File.read/1`
3. To write to a file use `File.write/2`
4. Every time you write something to a file with `File.write/2` a file descriptor is opened and a new elixir process is spawned. For this reason avoid writing to a file in a loop
5. You can open file for reading or writing with `File.open/2`. The second argument is a list of modes which allows you to choose if you open file for reading or writing
6. `File.open/2` returns a PID of a process that handles the file. To read or write to a file use functions from `IO` module and pass PID as IO device
7. When youre finished working with the file, close it with `File.close/1`
8. `IO.write/2` allows to write a string to a device (stdout by default). You can provide PID of file for writing
9. Use `trim: true` option in `String.split/3` to not include empty strings
10. To use anonymous function you need to prepend dot (`.`) before parentheses:
```elixir
myAddition = fn (a, b) -> a + b end
#function called using assigned name
IO.puts(myAddition.(2, 3)) # dot here before parentheses
```
11. You can write multiline anonymous functions:
```elixir
Enum.each(emails_list, fn x ->
    if send_fun.(x) == :ok do
    log_sent_email(pid, x)
    end
end)
```

# Links
1. https://exercism.org/tracks/elixir/exercises/newsletter
2. https://hexdocs.pm/elixir/1.15.7/IO.html

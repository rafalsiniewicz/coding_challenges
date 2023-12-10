# Conclussions
#### Exceptions
1. All errors in elixir implement the Exception Behaviour (behaviour is something like interface, it requires to implement some functions)
2. Excaption behaviour defines callback functions that module have to implement to fulfill the software contract of the behaviour
3. Once the error is defined it has the following properties:
- module name defines the error's name
- module defines error-struct
- the struct will have a `:message` field 
- module can be used with `raise/1` and `raise/2` to raise the intended error
4. Exception Behaviour specifies also two callbacks: `message/1` and `exception/1`. If they will not be implemented the module will use default implementations
5. `message/1` transforms the error struct to a readable message when called with `raise` 
6. `exception/1` allows additional context to be added to the message when its called with `raise/2`
#### Defining exception
1. To define an exception from an error module we use the `defexception` macro:
```elixir
# Defines a minimal error, with the name `MyError`
defmodule MyError do
  defexception message: "error"
end

# Defines an error with a customized exception/1 function
defmodule MyCustomizedError do
  defexception message: "custom error"

  @impl true
  def exception(value) do
    case value do
      [] ->
        %MyCustomizedError{}
      _ ->
        %MyCustomizedError{message: "Alert: " <> value}
    end
  end
end
``` 
2. Defined errors can be used like a built-in errors using either `raise/1` or `raise/2`:
- `raise/1` raises a specific error by its module name, or- if argument is a string- it will raise a `RuntimeError` with the string as a message
- `raise/2` raises a specific error by its module name and accepts an attributes argument which is used to obtain the error with the appropriate message
# Other
1. To define your own error struct use `defexception` keyword:
```elixir
defmodule CustomError
  defexception message: "custom error"
end
```
2. You can define error module inside other module:
```elixir
defmodule A do
 defmodule AError do
  defexception message: "A error"
 end
end
``` 
3. To have additional attrs returned after `raise` for your error struct, define `def exception/1` function:
```elixir
@impl true
def exception(value) do
  case value do
    [] ->
      %StackUnderflowError{}
    _ ->
      %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
  end
end
```

# Links
1. https://exercism.org/tracks/elixir/exercises/stack-underflow


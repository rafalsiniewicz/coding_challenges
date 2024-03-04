# Conclussions
### use macro
1. The `use` macro allows to extend module functionality by using other module's functionality. You can think of it as a kind of of inheritance in OOP.
2. When we `use` a module, that module can inject code into our module, e.g. it can define functions, `import` or `alias` other modules or set module attributes. Basically `use` can create functionality that we `use` in other modules
3. `use` macro is used for example in elixir tests, by:
```elixir
use ExUnit.Case
```
instruction in code. This single line of code is what makes the macros `test` and `assert` available in the test module.

4. `__using__` macro dictates what exactly will happen when you `use` a module. 
5. `__using__` macro takes one argument which is a keyword list with options and it returns a **quoted expression**. The code from quoted expression is inserted into module which calls `use` macro:
```elixir
defmodule ExUnit.Case do
  defmacro __using__(opts) do
    # some real-life ExUnit code omitted here
    quote do
      import ExUnit.Assertions
      import ExUnit.Case, only: [describe: 2, test: 1, test: 2, test: 3]
    end
  end
end
```
The options can be given as a 2nd argument when calling `use`, e.g. `use ExUnit.Case, async: true`. When not given explicitely it defaults to empty list
### Behaviours
6. Behaviours allows to create interfaces (set of functions and macros) in a *behaviour module* that can be later implemented by different *callback modules*. Thanks to shared interface those callback modules can be used interchangeably
7. To define behaviour you need to create a new module with set of functions that are part of interface. Each function needs to be defined using `@callback` module attribute. The syntax is identical to function typespec `@spec`, so we need to specify function name, a list of arguments types and all possible return types:
```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer
end
```
8. To add existing behaviour to other module (define a callback module):
    - we need to use the `@behaviour` attribute. Its value should be the name of the behaviour module that we are adding
    - we need to define all functions (callbacks) created in behaviour module. If youre implementing somebody else's beaviour then we should know/find behaviours callbacks in the documentation/source code. For example for elixir's built-in `Access` or `GenServer` modules you can see all their callbacks in documentation at: https://hexdocs.pm/  
9. A callback module is not limited to implement only functions from behaviour module, it can also extend its functionality/interface by adding its own functions
10. Callback module can implement multiple behaviours
11. To mark which function comes from which behaviour we should use the module attribute `@impl` before each implemented function. Its value should be the name of the behaviour module that defines this callback:
```elixir
defmodule BookCollection do
  @behaviour Countable

  defstruct [:list, :owner]

  @impl Countable
  def count(collection) do
    Enum.count(collection.list)
  end

  def mark_as_read(collection, book) do
    # other function unrelated to the Countable behaviour
  end
end
```
12. Its possible to define default callback implementation. It should be defined in `__using__` macro inside quoted expression. To make it possible for users to overwrite default callback function call the `defoverridable/1` macro after the function implementation. It accepts a keyword list of function names as keys and function arities as values:
```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer

  defmacro __using__(_) do
    quote do
      @behaviour Countable
      def count(collection), do: Enum.count(collection)
      defoverridable count: 1
    end
  end
end
```
13. NOTE! Defining functions in `__using__` macro should be only done to define default callback, but you can always define functions in another module and import it in the `__using__/1` macro
14. To make one module being `use`d by other modules you need to define `__using__/1` macro, e.g.:
```elixir
defmodule MyModule do
  defmacro __using__(_opts) do
    quote do
      import SomeOtherModule
    end
  end
end
```
15. Elixir doesnt have modulo operator `%` as other programming languages. To calculate modulo use `rem/2` function, e.g. `rem(4,2)` is `0`, `rem(4,3)` is `1`, etc.
16. You cant use the module in the same context that defines it (you can use its functions though, but cant define a struct for example). To overcome it you can create another struct which will use struct inside one of its functions (then you can create struct of previous module)
17. There is a `is_nubmer/1` function which check is value is integer of float

# Links
1. https://exercism.org/tracks/elixir/exercises/dancing-dots

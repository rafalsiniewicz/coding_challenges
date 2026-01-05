# Conclussions
1. Eager functions are the ones who are called immediately when code encounter their calls. On the other hand lazy functions are the ones who are called only if they need to be called by code, e.g:
```elixir
def greater_than(a, b) do
  if a > b do
    true
  else
    false
  end
end

def smaller_than(a, b) do
  if a < b do
    true
  else
    false
  end
end

if greater_than(1, 3) and smaller_than(1, 3) do
  IO.puts("Correct")
else
  IO.puts("Incorrect")
end
```
in eager evaluation both function calls will be evaluated, but in lazy evaluation only the first call will be evaluated, because since it will return false then the `if` statement will return false and go to `else` clause, no need to calculate the result of second call since it wont affect the program execution/result
2. All functions in `Enum` module are eager
3. When performing multiple operations on enumerables with the `Enum` module, each operation will be calculated and will generate an intermediate result
4. `Stream` module is a lazy alternative to the eager `Enum`. It evaluates operations results only when needed
5. `Stream` module has many of the same functions as `Enum` has, but instead of generating intermediate results, it builds a series of computations which are not evaluated, but theyre only executed once the stream is passed to a function from the `Enum` module
6. Streams implement `Enumerable` protocol 
7. Streams are composable, i.e. you can chain them together to create more complex functionality (functions get enumerable and return enumerable, so it can be used in piping)
8. If you want to access any element in iterable by index use `Enum.at` function
9. To get length of list just use kernel's built-in `length/1` function
10. To raise error with custom message use `raise Error, message: "some error message"`
11. You can use `Stream.unfold` to generate values with accumulator


# Links
1. https://www.tutorialspoint.com/functional_programming_with_java/functional_programming_with_java_evaluation.htm
2. https://exercism.org/tracks/elixir/exercises/lucas-numbers
3. https://hexdocs.pm/elixir/1.16.0/List.html
4. https://hexdocs.pm/elixir/1.16.0/Enum.html
5. https://elixirschool.com/en/lessons/intermediate/error_handling
6. 
defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}
        _ ->
          %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
      end
    end
  end

  # @spec divide(stack :: list()) :: integer() | DivisionByZeroError | StackUnderflowError
  # def divide(stack) when length(stack) < 2 do
  #   raise StackUnderflowError, "when dividing"
  # end

  # @spec divide(stack :: list()) :: integer() | DivisionByZeroError | StackUnderflowError
  # def divide([head | tail] = stack) when length(stack) == 2 do
  #   case [head | tail] do
  #     [0 | _] -> raise DivisionByZeroError
  #     _ -> hd(tail) / head

  #   end
  # end

  @spec divide(stack :: list()) :: integer() | DivisionByZeroError | StackUnderflowError
  def divide(stack) do
    case stack do
      [] -> raise StackUnderflowError, "when dividing"
      [_] -> raise StackUnderflowError, "when dividing"
      [0 | _] -> raise DivisionByZeroError
      [head | tail = [_]] -> hd(tail) / head
      _ -> "too many arguments"
    end
  end

end


# 1
# raise RPNCalculator.Exception.DivisionByZeroError

# 2
# alias RPNCalculator.Exception.StackUnderflowError
# raise StackUnderflowError

# raise StackUnderflowError, "when dividing"

# 3
# RPNCalculator.Exception.divide([])
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing

# RPNCalculator.Exception.divide([0, 100])
# => ** (DivisionByZeroError) division by zero occurred

RPNCalculator.Exception.divide([4, 16])
|> IO.inspect()

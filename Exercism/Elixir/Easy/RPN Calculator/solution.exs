defmodule RPNCalculator do
  def calculate!(stack, operation) do
    try do
      operation.(stack)
    rescue
      e -> raise e
    end
  end

  def calculate(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      _e -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      e -> {:error, e.message}
    end
  end
end

# 1

stack = []
operation = fn _ -> :ok end
:ok = RPNCalculator.calculate!(stack, operation)

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
IO.inspect(RPNCalculator.calculate!(stack, operation))
# => ** (ArgumentError) An error occurred

# 2
stack = []
operation = fn _ -> "operation completed" end
{:ok, "operation completed"} = RPNCalculator.calculate(stack, operation)

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
:error = RPNCalculator.calculate(stack, operation)

# 3
stack = []
operation = fn _ -> "operation completed" end
{:ok, "operation completed"} = RPNCalculator.calculate_verbose(stack, operation)

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
{:error, "An error occurred"} = RPNCalculator.calculate_verbose(stack, operation)

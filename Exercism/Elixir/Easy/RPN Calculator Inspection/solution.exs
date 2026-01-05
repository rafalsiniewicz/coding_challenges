defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    pid = spawn_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, ^pid, :normal} ->
        Map.put(results, input, :ok)
      {:EXIT, ^pid, _reason} ->
        Map.put(results, input, :error)
    after
      100 ->
        Map.put(results, input, :timeout)
    end
  end

  def reliability_check(calculator, inputs) do
    old_flag_value = Process.flag(:trap_exit, true)
    results =
      Enum.map(inputs, fn input -> start_reliability_check(calculator, input) end)
      |> Enum.reduce(%{}, fn process, results ->
        Map.merge(results, await_reliability_check_result(process, results))
    end)
    Process.flag(:trap_exit, old_flag_value)
    results
  end

  def correctness_check(calculator, inputs) do
    Enum.map(inputs, fn input -> Task.async(fn -> calculator.(input) end) end)
    |> Enum.map(fn task -> Task.await(task, 100)
    end)
  end
end

# 1
%{input: "2 3 +", pid: pid} = RPNCalculatorInspection.start_reliability_check(fn _ -> 0 end, "2 3 +")
|> IO.inspect()

# 2
# when an exit message is waiting for the process in its inbox
send(self(), {:EXIT, pid, :normal})

%{"5 7 -" => :ok} = RPNCalculatorInspection.await_reliability_check_result(
  %{input: "5 7 -", pid: pid},
  %{}
)
|> IO.inspect()

# when there are no messages in the process inbox
%{"5 7 -" => :ok, "3 2 *" => :timeout} = RPNCalculatorInspection.await_reliability_check_result(
  %{input: "3 2 *", pid: pid},
  %{"5 7 -" => :ok}
)
|> IO.inspect()

# 3
fake_broken_calculator = fn input ->
  if String.ends_with?(input, "*"), do: raise("oops")
end

inputs = ["2 3 +", "10 3 *", "20 2 /"]

%{
  "2 3 +" => :ok,
  "10 3 *" => :error,
  "20 2 /" => :ok
} = RPNCalculatorInspection.reliability_check(fake_broken_calculator, inputs)
|> IO.inspect()

# 4
fast_cheating_calculator = fn input -> 14 end
inputs = ["13 1 +", "50 2 *", "1000 2 /"]
RPNCalculatorInspection.correctness_check(fast_cheating_calculator, inputs)
|> IO.inspect()
# => [14, 14, 14]

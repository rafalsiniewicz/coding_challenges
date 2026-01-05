defmodule TakeANumber do

  @count 0

  @spec start() :: pid()
  def start() do
    spawn(fn -> receive_message(@count) end)
  end

  defp receive_message(count) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, count)
        receive_message(count)
      {:take_a_number, sender_pid} ->
        send(sender_pid, count + 1)
        receive_message(count + 1)
      :stop -> nil
      _ -> receive_message(count)
    end

  end
end

# 1
pid = TakeANumber.start()
true = is_pid(pid)
IO.inspect(pid)

# 2
machine_pid = TakeANumber.start()
true = Process.alive?(machine_pid)
IO.inspect(machine_pid)
IO.inspect(self())
send(machine_pid, {:report_state, self()})
send(machine_pid, {:report_state, self()})
receive do
  msg -> IO.inspect(msg)
end
receive do
  msg -> IO.inspect(msg)
end

# 3
machine_pid = TakeANumber.start()
send(machine_pid, {:take_a_number, self()})
send(machine_pid, {:take_a_number, self()})

receive do
  msg -> IO.inspect(msg)
end
receive do
  msg -> IO.inspect(msg)
end

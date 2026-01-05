defmodule TakeANumberDeluxe do
  # Client API
  use GenServer

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue_new_number)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next_queued_number, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset_state)
  end

  # Server callbacks

  @impl true
  def init(init_arg) do
    case TakeANumberDeluxe.State.new(init_arg[:min_number], init_arg[:max_number], Keyword.get(init_arg, :auto_shutdown_timeout, :infinity)) do
      {:ok, state} -> {:ok, state, state.auto_shutdown_timeout}
      {:error, error} -> {:stop, error}
    end
  end

  @impl true
  def handle_call(:report_state, _from, state) do
    {:reply, state, state, state.auto_shutdown_timeout}
  end

  @impl true
  def handle_call(:queue_new_number, _from, state) do
    case TakeANumberDeluxe.State.queue_new_number(state) do
      {:ok, new_number, new_state} -> {:reply, {:ok, new_number}, new_state, state.auto_shutdown_timeout}
      err = {:error, _error} -> {:reply, err, state, state.auto_shutdown_timeout}
    end
  end

  @impl true
  def handle_call({:serve_next_queued_number, priority_number}, _from, state) do
    case TakeANumberDeluxe.State.serve_next_queued_number(state, priority_number) do
      {:ok, next_number, new_state} -> {:reply, {:ok, next_number}, new_state, state.auto_shutdown_timeout}
      err = {:error, _error} -> {:reply, err, state, state.auto_shutdown_timeout}
    end
  end

  @impl true
  def handle_cast(:reset_state, state) do
    {:ok, new_state} = TakeANumberDeluxe.State.new(state.min_number, state.max_number, state.auto_shutdown_timeout)
    {:noreply, new_state, state.auto_shutdown_timeout}
  end

  @impl true
  def handle_info(:timeout, state) do
    {:stop, :normal, state}
  end

  @impl true
  def handle_info(_message, state) do
    {:noreply, state, state.auto_shutdown_timeout}
  end

end


# 1
{:ok, _pid} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 9)

# {:error, :invalid_configuration} = TakeANumberDeluxe.start_link(min_number: 9, max_number: 1)

# 2
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
%TakeANumberDeluxe.State{
       max_number: 10,
       min_number: 1,
       queue: %TakeANumberDeluxe.Queue{in: [], out: []},
       auto_shutdown_timeout: :infinity,
     } = TakeANumberDeluxe.report_state(machine)

# 3
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 2)
{:ok, 1} = TakeANumberDeluxe.queue_new_number(machine)

{:ok, 2} = TakeANumberDeluxe.queue_new_number(machine)

{:error, :all_possible_numbers_are_in_use} = TakeANumberDeluxe.queue_new_number(machine)

# 4
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
{:ok, 1} = TakeANumberDeluxe.queue_new_number(machine)

{:ok, 1} = TakeANumberDeluxe.serve_next_queued_number(machine)

{:error, :empty_queue} = TakeANumberDeluxe.serve_next_queued_number(machine)

# 5
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)

:ok = TakeANumberDeluxe.reset_state(machine)

# 6
{:ok, machine} =
  TakeANumberDeluxe.start_link(
    min_number: 1,
    max_number: 10,
    auto_shutdown_timeout: :timer.minutes(1)
  )

# after 3 hours...

TakeANumberDeluxe.queue_new_number(machine)
# => ** (exit) exited in: GenServer.call(#PID<0.171.0>, :queue_new_number, 5000)
#        ** (EXIT) no process: the process is not alive or there's no process currently associated with the given name, possibly because its application isn't started
#       (elixir 1.13.0) lib/gen_server.ex:1030: GenServer.call/3


timeout = 50

{:ok, pid} =
  TakeANumberDeluxe.start_link(min_number: 1, max_number: 2, auto_shutdown_timeout: timeout)

Process.alive?(pid)
|> IO.inspect()
{:ok, 1} = TakeANumberDeluxe.queue_new_number(pid)
{:ok, 2} = TakeANumberDeluxe.queue_new_number(pid)
{:error, :all_possible_numbers_are_in_use} = TakeANumberDeluxe.queue_new_number(pid)
Process.alive?(pid)
|> IO.inspect()
:timer.sleep(timeout * 2)
Process.alive?(pid)
|> IO.inspect()

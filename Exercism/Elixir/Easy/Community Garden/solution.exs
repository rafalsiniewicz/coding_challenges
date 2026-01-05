# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  use Agent

  def start(opts \\ []) do
    Agent.start(fn -> {[], 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state end)
    |> elem(0)
  end

  def register(pid, register_to) do
    plot = %Plot{plot_id: elem(Agent.get(pid, fn state -> state end), 1), registered_to: register_to}
    Agent.update(
      pid,
      fn state ->
        if elem(state, 0) == [] do
          {[plot], elem(state, 1) + 1}
        else
          {[plot | elem(state, 0)], elem(state, 1) + 1}
        end
      end
    )
    plot
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state -> {Enum.reject(elem(state, 0), fn x -> x.plot_id == plot_id end), elem(state, 1)} end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state -> Enum.find(elem(state, 0), {:not_found, "plot is unregistered"}, fn x -> x.plot_id == plot_id end) end)
  end
end

# 1
{:ok, pid} = CommunityGarden.start()
is_pid(pid) == true
IO.inspect(pid)

# 2
[] = CommunityGarden.list_registrations(pid)

# 3
IO.inspect(CommunityGarden.register(pid, "Emma Balan"))

IO.inspect(CommunityGarden.list_registrations(pid))

# 4
:ok = CommunityGarden.release(pid, 1)

[] = CommunityGarden.list_registrations(pid)

# 5
IO.inspect(CommunityGarden.register(pid, "Emma Balan"))
IO.inspect(CommunityGarden.get_registration(pid, 2))
{:not_found, "plot is unregistered"} = CommunityGarden.get_registration(pid, 7)

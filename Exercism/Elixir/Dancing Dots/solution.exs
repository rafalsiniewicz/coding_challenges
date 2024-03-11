defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts :: opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot :: dot(), frame_number :: frame_number(), opts :: opts()) :: dot()

  defmacro __using__(_opts) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end

end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, _opts) do
    case rem(frame_number, 4) do
      0 ->
        %{dot | opacity: dot.opacity / 2}
      _ ->
        dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init(opts) do
    velocity = Keyword.get(opts, :velocity)
    case velocity |> is_number() do
      true ->
        {:ok, opts}
      false ->
        {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
    end
  end

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, opts) do
    %{dot | radius: dot.radius + (frame_number - 1) * Keyword.get(opts, :velocity)}
  end
end


# 2
defmodule MyCustomAnimation do
  use DancingDots.Animation
end

{:ok, [some_option: true]} = MyCustomAnimation.init(some_option: true)


# 3
defmodule DancingDots.Dot do
  defstruct [:x, :y, :radius, :opacity]
end

defmodule Test3 do
  def test() do
    dot = %DancingDots.Dot{x: 100, y: 100, radius: 24, opacity: 1}
    %DancingDots.Dot{opacity: 1, radius: 24, x: 100, y: 100} = DancingDots.Flicker.handle_frame(dot, 1, [])
    %DancingDots.Dot{opacity: 0.5, radius: 24, x: 100, y: 100} = DancingDots.Flicker.handle_frame(dot, 4, [])
  end
end

Test3.test()

# 4
defmodule Test4 do
  def test() do
    {:error, "The :velocity option is required, and its value must be a number. Got: nil"} = DancingDots.Zoom.init(velocity: nil)
    dot = %DancingDots.Dot{x: 100, y: 100, radius: 24, opacity: 1}

    %DancingDots.Dot{radius: 24, opacity: 1, x: 100, y: 100} = DancingDots.Zoom.handle_frame(dot, 1, velocity: 10)

    %DancingDots.Dot{radius: 34, opacity: 1, x: 100, y: 100} = DancingDots.Zoom.handle_frame(dot, 2, velocity: 10)
  end
end

Test4.test()

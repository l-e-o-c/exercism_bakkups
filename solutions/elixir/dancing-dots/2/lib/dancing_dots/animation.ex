defmodule DancingDots.Animation do
  alias DancingDots.Animation
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  # Please implement the module
  @callback init(opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot(), frame_number(), opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  alias DancingDots.Animation
  alias DancingDots.Dot
  
  @behaviour Animation

  @impl Animation
  def init(opts), do: {:ok, opts}

  @impl Animation
  def handle_frame(%Dot{} = dot, frame_number, _opts) when rem(frame_number, 4) == 0,
    do: %{dot | opacity: dot.opacity / 2}

  @impl Animation
  def handle_frame(dot, _frame_number, _opts), do: dot
end

defmodule DancingDots.Zoom do
  alias DancingDots.Animation
  alias DancingDots.Dot
  
  @behaviour Animation

  @impl Animation
  def init(velocity: velocity) when is_number(velocity),
    do: {:ok, velocity: velocity}

  @impl Animation
  def init(velocity: velocity),
    do:
      {:error,
       "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}

  @impl Animation
  def init(_),
    do: {:error, "The :velocity option is required, and its value must be a number. Got: nil"}

  @impl Animation
  def handle_frame(%Dot{} = dot, frame_number, velocity: velocity) do
    %{dot | radius: dot.radius + (frame_number - 1) * velocity}
  end
end

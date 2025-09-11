# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    {initial_registrations, opts} = Keyword.pop(opts, :initial_registrations, [])
    Agent.start_link(fn -> {0, initial_registrations} end, opts)
  end

  def list_registrations(pid) do
    {_, plots} = Agent.get(pid, & &1)
    plots
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {counter, plots} ->
      new_counter = counter + 1
      new_plot = %Plot{plot_id: new_counter, registered_to: register_to}
      {new_plot, {new_counter, [new_plot | plots]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn {counter, plots} ->
      new_plots =
        for %Plot{plot_id: id, registered_to: name} <- plots,
            id != plot_id do
          %Plot{plot_id: id, registered_to: name}
        end

      {:ok, {counter, new_plots}}
    end)
  end

  def get_registration(pid, plot_id) do
    plots = list_registrations(pid)

    plot =
      for %Plot{plot_id: id, registered_to: name} <- plots,
          id == plot_id do
        %Plot{plot_id: id, registered_to: name}
      end

      case plot do
        [] -> {:not_found, "plot is unregistered"}
        [x] -> x
        _ -> :error
      end
  end
end

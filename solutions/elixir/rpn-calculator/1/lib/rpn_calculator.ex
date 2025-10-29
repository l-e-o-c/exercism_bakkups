defmodule RPNCalculator do
  def calculate!(stack, operation) do
    try do
      operation.(stack)
    rescue
      ArgumentError ->
        raise ArgumentError, "An error occured"
    end
  end

  def calculate(stack, operation) do
    try do
      throw(operation.(stack))
    rescue
      _ ->
        :error
    catch
      x -> {:ok, x}
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      throw(operation.(stack))
    rescue
      e ->
        {:error, e.message}
    catch
      x -> {:ok, x}
    end
  end
end
